//
//  CityWeatherInfoTableViewCell.swift
//  WeatherInfoAustralia
//
//  Created by Jigar Thakkar on 20/2/18.
//  Copyright © 2018 Jigar Thakkar. All rights reserved.
//

import UIKit
class CityWeatherInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var temperatureOfCity: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
