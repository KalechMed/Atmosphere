//
//  DetailsView.swift
//  weatherapp
//
//  Created by Mohamed  on 8/9/2023.
//

import SwiftUI

struct DetailsView: View {
    
    
    @Environment(\.colorScheme) var colorScheme
    
    @ObservedObject var locationManager = LocationManager()
    @StateObject private var weatherViewModel = WeatherViewModel()
    
    var body: some View {
        
        
        
        VStack(alignment: .leading,spacing: 10)
        {
            
            
            Text("Details")
                .font(TypefaceOne.medium.font(size: 20))
                .foregroundColor(Color("Bluee"))
            
            
            
            HStack(spacing: 20)
            {
                
                VStack(alignment: .leading)
                {
                    
                    if colorScheme == .dark {
                               Image("windLight")
                            .resizable()
                            .frame(width: 14, height: 14)
                           } else {
                               Image("windDark")
                                   .resizable()
                                   .frame(width: 14, height: 14)
                           }
                        
                    
                    
                    Text("Wind")
                        .font(TypefaceOne.medium.font(size: 18))
                        .foregroundColor(Color("txtColor"))
                    
                    HStack(spacing: 4)
                    {
                        if let weather = weatherViewModel.weather {
                            Text(String(format: "%.1f", weather.current.wind_kph))
                            Text("Kmh")
                        }
                    }
                    .font(TypefaceOne.medium.font(size: 14))
                    .foregroundColor(Color("Bluee"))
                    .padding(.trailing,14)
                    
                    
                }
                .padding(10)
                .frame(width: 108)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color("Bluee"), lineWidth: 1)
                )
                
                
                VStack(alignment: .leading)
                {
                    
                    if colorScheme == .dark {
                        Image("pressureLight")
                            .resizable()
                            .frame(width: 14, height: 14)
                    } else {
                        Image("pressureDark")
                            .resizable()
                            .frame(width: 14, height: 14)
                    }
                    
                    
                    Text("pressure")
                        .font(TypefaceOne.medium.font(size: 18))
                        .foregroundColor(Color("txtColor"))
                    
                    HStack(spacing: 4)
                    {
                        if let weather = weatherViewModel.weather {
                            Text("\(weather.current.humidity)")
                            Text("MB")
                        }
                        
                    }
                    .font(TypefaceOne.medium.font(size: 14))
                    .foregroundColor(Color("Bluee"))
                    
                    
                }
                .padding(10) // Add padding to space the components from the stroke
                .frame(width: 108)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color("Bluee"), lineWidth: 1)
                )
                
                VStack(alignment: .leading)
                {
                    
                    if colorScheme == .dark {
                               Image("humidityLight")
                            .resizable()
                            .frame(width: 14, height: 14)
                           } else {
                               Image("humidityDark")
                                   .resizable()
                                   .frame(width: 14, height: 14)
                           }
                    
                    
                    Text("humidity")
                        .font(TypefaceOne.medium.font(size: 18))
                        .foregroundColor(Color("txtColor"))
                    
                    HStack(spacing: 4)
                    {
                        if let weather = weatherViewModel.weather {
                            Text("\(weather.current.humidity)")
                            Text("%")
                        }
                        
                       
                        
                    }
                    .font(TypefaceOne.medium.font(size: 14))
                    .foregroundColor(Color("Bluee"))
                    
                    
                }
                .padding(10)
                .frame(width: 108)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color("Bluee"), lineWidth: 1)
                )
                
                
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    weatherViewModel.current(city: locationManager.city) {
                    
                    }
                }
            }
            
           
            
            
            
            
        
        }
        .padding(.horizontal)
    }
}

#Preview {
    DetailsView()
}
