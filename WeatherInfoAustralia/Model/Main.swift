//
//  Main.swift
//  WeatherInformation
//
//  Created by Jigar Thakkar on 19/2/18.
//  Copyright © 2018 Jigar Thakkar. All rights reserved.
//
//  
//

import Foundation


struct Main: JSONCompatible {
    var humidity: Int
    var temp_min: Int
    var temp_max: Int
    var temp: Double
    var pressure: Int


    init?(json: [String: Any]?) {
        guard let json = json else {return nil}
        humidity = json["humidity"] as? Int ?? 0
        temp_min = json["temp_min"] as? Int ?? 0
        temp_max = json["temp_max"] as? Int ?? 0
        temp = json["temp"] as? Double ?? 0.0
        pressure = json["pressure"] as? Int ?? 0
    }



    init() {
        self.init(json: [:])!
    }



    init?(data: Data?) {
        guard let data = data else {return nil}
        guard let json = (try? JSONSerialization.jsonObject(with: data, options: [])) as? [String: Any] else {return nil}
        self.init(json: json)
    }



    init(humidity: Int, temp_min: Int, temp_max: Int, temp: Double, pressure: Int) {
        self.humidity = humidity
        self.temp_min = temp_min
        self.temp_max = temp_max
        self.temp = temp
        self.pressure = pressure
    }



    /// This function generate a json dictionary from the model.
    ///
    /// - Parameter useOriginalJsonKey: This parameter take effect only when you have modified a property's name making it different to the original json key. If true, the original json key will be used when generate json dictionary, otherwise, the modified property name will be used as key in the dictionary.
    func jsonDictionary(useOriginalJsonKey: Bool) -> [String: Any] {
        var dict: [String: Any] = [:]
        dict["humidity"] = humidity
        dict["temp_min"] = temp_min
        dict["temp_max"] = temp_max
        dict["temp"] = temp
        dict["pressure"] = pressure
        return dict
    }



}



