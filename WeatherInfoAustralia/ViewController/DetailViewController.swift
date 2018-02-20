//
//  DetailViewController.swift
//  WeatherInfoAustralia
//
//  Created by Jigar Thakkar on 20/2/18.
//  Copyright © 2018 Jigar Thakkar. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UICollectionViewDataSource, UITableViewDelegate {
    @IBOutlet weak var city: UIImageView!
    
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var thermometerFix: UIImageView!
    @IBOutlet weak var temprature: UILabel!
    @IBOutlet weak var weatherInfo: UILabel!
    @IBOutlet weak var collection: UICollectionView!
    
  var selectedWeatherInformationObject : WeatherInformation = InfoDetail.sharedInstant.selectedWeatherInfo

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.navigationItem.title = selectedWeatherInformationObject.name
        temprature.text = "\(selectedWeatherInformationObject.main.temp)°"
        weatherInfo.text = selectedWeatherInformationObject.weather[0].description
        
        weatherImage.image = UIImage(named: "cloudy")
        city.image = UIImage(named: selectedWeatherInformationObject.name)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailCollectionViewCell", for: indexPath) as! DetailCollectionViewCell
        
        let cellData = self.getData(row: indexPath.row)
        
        
        cell.detailImage.image = UIImage(named: cellData.nameOfImage)
        cell.detailInfo.text = cellData.detailText

        performCellAnimation(cell: cell)
        return cell
    }
    
    
    //MARK: user defined methods
    
    private func getData(row : Int)-> (detailText:String,nameOfImage:String)    //Using tuples, get the value corresponding to the cell
    {
        var dataText = ""
        var imageName = ""
        
        switch row {
        case 0:
            dataText = "\(selectedWeatherInformationObject.main.humidity)%"
            imageName = "humidity"
        case 1:
            dataText = "\(selectedWeatherInformationObject.main.temp_max)°%"
            imageName = "temp_max"
        case 2:
            dataText = "\(selectedWeatherInformationObject.main.temp_min)°%"
            imageName = "temp_min"
        case 3:
            dataText = "\(selectedWeatherInformationObject.wind.speed)m/s"
            imageName = "windspeed"
        case 4:
            let date = NSDate(timeIntervalSince1970: TimeInterval(selectedWeatherInformationObject.sys.sunrise))
            dataText = getTimeStringFromDate(date: date as Date)
            imageName = "sunrise"
        case 5:
            let date = NSDate(timeIntervalSince1970: TimeInterval(selectedWeatherInformationObject.sys.sunset))
            dataText = getTimeStringFromDate(date: date as Date)
            imageName = "sunset"
        default:
            dataText = "\(selectedWeatherInformationObject.main.humidity)%"
            imageName = "humidity"
        }
        
        return (dataText,imageName)
    }
    //Cell animation method
    private func performCellAnimation(cell:DetailCollectionViewCell){
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 5, options: [],
                       animations: {
                        cell.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
                        
        },
                       completion: { finished in
                        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 3, options: .curveEaseInOut,
                                       animations: {
                                        cell.transform = CGAffineTransform(scaleX: 1, y: 1)
                        },
                                       completion: nil
                        )
        }
        )
    }

    private func getTimeStringFromDate(date : Date) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .none
        dateFormatter.timeStyle = .short
        let dataString = dateFormatter.string(from: date)
        return dataString
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
