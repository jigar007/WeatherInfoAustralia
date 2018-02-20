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
        
        navigationBar(title: "Weather in Australia")
        
        updateWeatherInformation(cityID: Sydney)
        updateWeatherInformation(cityID: Melbourne)
        updateWeatherInformation(cityID: Brisbane)
        tableView.reloadData()
        self.tableView.tableFooterView = UIView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
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
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        InfoDetail.sharedInstant.selectedWeatherInfo = cityWeather[indexPath.row]
        performSegue(withIdentifier: "detailWeather", sender: self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         print(self.cityWeather.count)
        return self.cityWeather.count
       
    }
  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier:"reuseIdentifier", for: indexPath) as! CityWeatherInfoTableViewCell
        
        var imageView  = UIImageView(frame:CGRect(x: 0, y: 0, width: 100, height: 400))
        let image = UIImage(named: cityWeather[indexPath.row].name )
        
        cell.backgroundColor = UIColor.clear
        
        imageView = UIImageView(image:image)
      
        cell.backgroundView = imageView
        cell.cityName.text = cityWeather[indexPath.row].name
        cell.temperatureOfCity.text = "\( cityWeather[indexPath.row].main.temp) °C";
        return cell
    }
    
    func navigationBar(title:String){
        // For Button and title in navigation bar
        let tlabel = UILabel(frame: CGRect(origin: CGPoint(x: 0,y :0), size: CGSize(width: 200, height: 40)))
        tlabel.text = title
        tlabel.font = UIFont(name: "Helvetica", size: 25.0)
        tlabel.adjustsFontSizeToFitWidth = true
        self.navigationItem.titleView = tlabel
    }

}

