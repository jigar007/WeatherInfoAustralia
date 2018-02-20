//
//  Clouds.swift
//  WeatherInformation
//
//  Created by Jigar Thakkar on 19/2/18.
//  Copyright © 2018 Jigar Thakkar. All rights reserved.
//
//  
//

import Foundation


struct Clouds: JSONCompatible {
    var all: Int


    init?(json: [String: Any]?) {
        guard let json = json else {return nil}
        all = json["all"] as? Int ?? 0
    }



    init() {
        self.init(json: [:])!
    }



    init?(data: Data?) {
        guard let data = data else {return nil}
        guard let json = (try? JSONSerialization.jsonObject(with: data, options: [])) as? [String: Any] else {return nil}
        self.init(json: json)
    }



    init(all: Int) {
        self.all = all
    }



    /// This function generate a json dictionary from the model.
    ///
    /// - Parameter useOriginalJsonKey: This parameter take effect only when you have modified a property's name making it different to the original json key. If true, the original json key will be used when generate json dictionary, otherwise, the modified property name will be used as key in the dictionary.
    func jsonDictionary(useOriginalJsonKey: Bool) -> [String: Any] {
        var dict: [String: Any] = [:]
        dict["all"] = all
        return dict
    }



}



