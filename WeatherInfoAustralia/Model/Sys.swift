//
//  Sys.swift
//  WeatherInformation
//
//  Created by Jigar Thakkar on 19/2/18.
//  Copyright © 2018 Jigar Thakkar. All rights reserved.
//
//  
//

import Foundation


struct Sys: JSONCompatible {
    var sunset: Int
    var sunrise: Int
    var message: Double
    var id: Int
    var type: Int
    var country: String


    init?(json: [String: Any]?) {
        guard let json = json else {return nil}
        sunset = json["sunset"] as? Int ?? 0
        sunrise = json["sunrise"] as? Int ?? 0
        message = json["message"] as? Double ?? 0.0
        id = json["id"] as? Int ?? 0
        type = json["type"] as? Int ?? 0
        country = json["country"] as? String ?? ""
    }



    init() {
        self.init(json: [:])!
    }



    init?(data: Data?) {
        guard let data = data else {return nil}
        guard let json = (try? JSONSerialization.jsonObject(with: data, options: [])) as? [String: Any] else {return nil}
        self.init(json: json)
    }



    init(sunset: Int, sunrise: Int, message: Double, id: Int, type: Int, country: String) {
        self.sunset = sunset
        self.sunrise = sunrise
        self.message = message
        self.id = id
        self.type = type
        self.country = country
    }


    /// This function generate a json dictionary from the model.
    ///
    /// - Parameter useOriginalJsonKey: This parameter take effect only when you have modified a property's name making it different to the original json key. If true, the original json key will be used when generate json dictionary, otherwise, the modified property name will be used as key in the dictionary.
    func jsonDictionary(useOriginalJsonKey: Bool) -> [String: Any] {
        var dict: [String: Any] = [:]
        dict["sunset"] = sunset
        dict["sunrise"] = sunrise
        dict["message"] = message
        dict["id"] = id
        dict["type"] = type
        dict["country"] = country
        return dict
    }

}



