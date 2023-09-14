//
//  WeatherViewModel.swift
//  weatherapp
//
//  Created by Mohamed  on 5/9/2023.
//

import Foundation

class WeatherViewModel: ObservableObject {
    @Published var weather: Weather?
    @Published var weatherStatuses: [WeatherStatus] = []
    let apiKey = "37f42686371e4bd5a6f162602230209"
    
    func current(city: String, completion: @escaping () -> Void) {
        
        let apiUrl = "http://api.weatherapi.com/v1/current.json?key=\(apiKey)&q=\(city)&aqi=no"
        
        if let url = URL(string: apiUrl) {
            URLSession.shared.dataTask(with: url) { [self] data, _, error in
                if let data = data {
                    let decoder = JSONDecoder()
                    if let decodedData = try? decoder.decode(Weather.self, from: data) {
                        DispatchQueue.main.async {
                            self.weather = decodedData
                        }
                        completion()
                    }
                    
                }
            }.resume()
        }
    }
    
    func fetchWeatherData(for city: String) {
            
            let urlString = "http://api.weatherapi.com/v1/forecast.json?key=\(apiKey)&q=\(city)&days=1&aqi=no&alerts=no"
            
            guard let url = URL(string: urlString) else {
                print("Invalid URL")
                return
            }
            
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else {
                    print("Error: \(error?.localizedDescription ?? "Unknown error")")
                    return
                }
                
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                        // Parse the JSON response and populate weatherStatuses
                        if let forecast = json["forecast"] as? [String: Any],
                           let forecastday = forecast["forecastday"] as? [[String: Any]] {
                            // Find the first forecastday, as per your example
                            if let firstDay = forecastday.first,
                               let hours = firstDay["hour"] as? [[String: Any]] {
                                // Parse the hours array and create WeatherStatus objects
                                var statuses: [WeatherStatus] = []
                                for hour in hours {
                                                   if let time = hour["time"] as? String,
                                                      let tempC = hour["temp_c"] as? Double,
                                                      let condition = hour["condition"] as? [String: Any],
                                                      let conditionText = condition["text"] as? String {
                                                       let status = WeatherStatus(time: time, tempC: tempC, conditionText: conditionText)
                                                       statuses.append(status)
                                                   }
                                               }
                                
                                // Update UI on the main thread
                                DispatchQueue.main.async {
                                    self.weatherStatuses = statuses
                                }
                            }
                        }
                    }
                } catch {
                    print("Error parsing JSON: \(error.localizedDescription)")
                }
            }
            
            task.resume()
        }
    
    
    
    
    
}

