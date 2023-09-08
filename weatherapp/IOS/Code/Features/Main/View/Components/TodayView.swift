//
//  TodayView.swift
//  weatherapp
//
//  Created by Mohamed  on 7/9/2023.
//

import SwiftUI

struct TodayView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var locationManager = LocationManager()
    @ObservedObject var weatherViewModel = WeatherViewModel()
    
    var body: some View {
        
        VStack(alignment: .leading)
        {
            
            Text("Today")
                .font(TypefaceOne.medium.font(size: 20))
                .foregroundColor(Color("Bluee"))
            
            
            ScrollView(.horizontal) {
                HStack(spacing: 20) {
                    ForEach(weatherViewModel.weatherStatuses) { status in
                        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/,spacing: 2)
                        {
                            let formattedTime = formatTime(status.time)
                            
                            Text("\(formattedTime)")
                                .font(TypefaceOne.medium.font(size: 16))
                                .foregroundColor(Color("txtColor"))
                            
                            Image("sunny")
                            
                            
                            HStack()
                            {
                                Text(String(format: "%.1f", status.tempC))
                                    .font(TypefaceOne.medium.font(size: 16))
                                    .foregroundColor(Color("txtColor"))
                                
                                Text("°C")
                                    .foregroundColor(Color("txtColor"))
                                    .font(TypefaceOne.semiBold.font(size: 14))
                                    .padding(.bottom,2)
                                
                            }
                            
                            
                            
                        }
                        .padding(5)
                        .padding(.horizontal,16)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundColor(Color("ItemBg"))
                        )
                        
                    }
                    
                    
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        weatherViewModel.fetchWeatherData(for: locationManager.city)
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
    
}

#Preview {
    TodayView()
}
