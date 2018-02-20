//
//  WeatherInformationBusinessLayer.swift
//  Weather
//
//  Created by Pradeep Choudhary on 19/2/18.
//  Copyright © 2018 Jigar Thakkar chaudhary. All rights reserved.
//

import UIKit

class WeatherInfoSingletone: NSObject
{
    class var sharedInstance: WeatherInfoSingletone {
        struct Static {
            static let instance: WeatherInfoSingletone = WeatherInfoSingletone()
        }
        return Static.instance
    }
    
    func parseArrayJsonData(data: Dictionary<String, Any>) -> (WeatherInformation) {
        let modelObject: WeatherInformation = WeatherInformation(json: data)!
        return modelObject
    }
}
