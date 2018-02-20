//
//  JSONCompatible.swift
//  WeatherInformation
//
//  Created by Jigar Thakkar on 19/2/18.
//  Copyright © 2018 Jigar Thakkar. All rights reserved.
//
//  
//

import Foundation


protocol JSONCompatible {
    init?(json: [String: Any]?)
    init()
    init?(data: Data?)
    func jsonDictionary(useOriginalJsonKey: Bool) -> [String: Any]
}



