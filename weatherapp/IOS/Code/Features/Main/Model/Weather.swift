//
//  Weather.swift
//  weatherapp
//
//  Created by Mohamed  on 5/9/2023.
//

struct Weather: Codable {
    struct Location: Codable {
        let name: String
        let country: String
    }

    struct Current: Codable {
        let pressure_mb: Double
        let humidity: Int
        let wind_kph: Double
        let temp_c: Double
    }

    let location: Location
    let current: Current
}

