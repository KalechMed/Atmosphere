//
//  TodayView.swift
//  weatherapp
//
//  Created by Mohamed  on 7/9/2023.
//

import SwiftUI

struct TodayView: View {
    
    //Mark - Variables
    
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var locationManager = LocationManager()
    @ObservedObject var weatherViewModel = WeatherViewModel()
    @State var weatherstatus: WeatherStatus?
    
    //Mark - Views
    var body: some View {
        
        VStack(alignment: .leading)
        {
            
            Text("Today")
                .font(Poppins.medium.font(size: 20))
                .foregroundColor(Color("Bluee"))
            
            
            ScrollView(.horizontal) {
                HStack(spacing: 30) {
                    ForEach(weatherViewModel.weatherStatuses) { status in
                        
                        let formattedTime = formatTime(status.time)
                        let currentTime = formatTime(Date())
                        
                        if formattedTime >= currentTime {
                            VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/,spacing: -2)
                            {
                                
                                
                                Text("\(formattedTime)")
                                    .font(Poppins.medium.font(size: 16))
                                    .foregroundColor(Color("txtColor"))
                                
                                
                                switch status.conditionText {
                                                case "sunny":
                                                    Image("sunny")
                                                case "Partly cloudy":
                                                    Image("Partly cloudy")
                                                case "Cloudy":
                                                    Image("Cloudy")
                                case "Overcast":
                                    Image("Overcast")
                                case "Mist":
                                    Image("Mist")
                                case "Light rain":
                                    Image("Light rain")
                                case "Heavy rain":
                                    Image("Heavy rain")
                                case "Light snow":
                                    Image("Light snow")
                                case "Heavy snow":
                                    Image("Heavy snow")
                                    
                                               
                                                default:
                                                    Image("sunny")
                                                }
                                
                                
                                HStack()
                                {
                                    Text(String(format: "%.1f", status.tempC))
                                        .font(Poppins.medium.font(size: 16))
                                        .foregroundColor(Color("txtColor"))
                                    
                                    Text("°C")
                                        .foregroundColor(Color("txtColor"))
                                        .font(Poppins.semiBold.font(size: 14))
                                        .padding(.bottom,2)
                                    
                                }
                                
                                
                                
                            }
                            .padding(5)
                            .padding(.horizontal,14)
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .foregroundColor(Color("ItemBg"))
                            )
                            .scrollTransition(topLeading: .interactive,
                                              bottomTrailing: .interactive,
                                              axis: .horizontal) { effect, phase in
                                effect
                                    .scaleEffect(1 - abs(phase.value))
                                    .opacity(1 - abs(phase.value))
                                
                            }
                                              .onTapGesture {
                                                  withAnimation {
                                                      self.weatherstatus = status
                                                  }
                                              }
                            
                        }
                    }
                    
                    
                }
                .onReceive(locationManager.locationPermissionDidChange) { isPermissionGranted in
                    if isPermissionGranted {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            weatherViewModel.fetchWeatherData(for:locationManager.city)
                        }
                    }
                }
                
                
                
            }
        }
        .padding(.horizontal)
       
        
    }
    
    private func formatTime(_ time: String) -> String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
            if let date = dateFormatter.date(from: time) {
                dateFormatter.dateFormat = "HH:mm"
                return dateFormatter.string(from: date)
            }
            return time
        }
    
    private func formatTime(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: date)
    }
    
    
    
}

#Preview {
    TodayView()
}
