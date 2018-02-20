//
//  ViewController.swift
//  WeatherInfoAustralia
//
//  Created by Jigar Thakkar on 19/2/18.
//  Copyright © 2018 Jigar Thakkar. All rights reserved.
//

import UIKit

class CityInfoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    var cityWeather : [WeatherInformation] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        arrayCityList=["Melbourne","Sydney","Brisbane"]
        updateWeatherInformation(cityID: Sydney)
         updateWeatherInformation(cityID: Melbourne)
        updateWeatherInformation(cityID: Brisbane)
        self.tableView.reloadData()
        self.tableView.tableFooterView = UIView()
    }
    
    func updateWeatherInformation(cityID: String){
        
        let weatherInfoUrl = API_URL + "id=\(cityID)&units=\(UNIT)&APPID=\(API_KEY)"
        
        let url = URL(string: weatherInfoUrl)
        URLSession.shared.dataTask(with:url!, completionHandler: {(data, response, error) in
            guard let data = data, error == nil else { return }
            
            do {
                
                let json = try JSONSerialization.jsonObject(with: data)as! Dictionary<String, Any>
                print(json)
                self.cityWeather.append(WeatherInfoSingletone.sharedInstance.parseArrayJsonData(data: json))
                print(self.cityWeather[0])
                print(self.cityWeather.count)
                self.tableView.reloadData()
            } catch let error as NSError {
                print(error)
            }
        }).resume()
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "detailWeather", sender: self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         print(self.cityWeather.count)
        return self.cityWeather.count
       
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier:"reuseIdentifier", for: indexPath) as! CityWeatherInfoTableViewCell
        cell.cityName.text = cityWeather[indexPath.row].name
        cell.temperatureOfCity.text = "\( cityWeather[indexPath.row].main.temp) °C";
        return cell
    }

}

