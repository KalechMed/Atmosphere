//
//  WeatherStatus.swift
//  weatherapp
//
//  Created by Mohamed  on 7/9/2023.
//

import Foundation

struct WeatherStatus: Identifiable {
    let id = UUID()
    let time: String
    let tempC: Double
    let conditionText: String
}
