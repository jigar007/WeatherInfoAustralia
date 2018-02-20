//
//  Wind.swift
//  WeatherInformation
//
//  Created by Jigar Thakkar on 19/2/18.
//  Copyright © 2018 Jigar Thakkar. All rights reserved.
//
//  
//

import Foundation


struct Wind: JSONCompatible {
    var deg: Int
    var speed: Double


    init?(json: [String: Any]?) {
        guard let json = json else {return nil}
        deg = json["deg"] as? Int ?? 0
        speed = json["speed"] as? Double ?? 0.0
    }



    init() {
        self.init(json: [:])!
    }



    init?(data: Data?) {
        guard let data = data else {return nil}
        guard let json = (try? JSONSerialization.jsonObject(with: data, options: [])) as? [String: Any] else {return nil}
        self.init(json: json)
    }



    init(deg: Int, speed: Double) {
        self.deg = deg
        self.speed = speed
    }



    /// This function generate a json dictionary from the model.
    ///
    /// - Parameter useOriginalJsonKey: This parameter take effect only when you have modified a property's name making it different to the original json key. If true, the original json key will be used when generate json dictionary, otherwise, the modified property name will be used as key in the dictionary.
    func jsonDictionary(useOriginalJsonKey: Bool) -> [String: Any] {
        var dict: [String: Any] = [:]
        dict["deg"] = deg
        dict["speed"] = speed
        return dict
    }



}



