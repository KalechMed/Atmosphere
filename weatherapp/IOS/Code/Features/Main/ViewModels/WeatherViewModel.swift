//
//  WeatherViewModel.swift
//  weatherapp
//
//  Created by Mohamed  on 5/9/2023.
//

import Foundation

class WeatherViewModel: ObservableObject {
    @Published var weather: Weather?

    func current(city: String, completion: @escaping () -> Void) {
        let apiKey = "37f42686371e4bd5a6f162602230209"
        let apiUrl = "http://api.weatherapi.com/v1/current.json?key=\(apiKey)&q=\(city)&aqi=no"

        if let url = URL(string: apiUrl) {
            URLSession.shared.dataTask(with: url) { [self] data, _, error in
                if let data = data {
                    let decoder = JSONDecoder()
                    if let decodedData = try? decoder.decode(Weather.self, from: data) {
                        self.weather = decodedData
                        
                        completion()
                    }
                    print("weather\(weather)")
                }
            }.resume()
        }
    }
}

