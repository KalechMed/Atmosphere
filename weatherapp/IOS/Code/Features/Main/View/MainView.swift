//
//  ContentView.swift
//  weatherapp
//
//  Created by Mohamed  on 3/9/2023.
//

import SwiftUI
import CoreLocation

struct MainView: View {
    
    //Mark - Variables
    
    @Binding var wind:String
    @Binding var pressure:String
    @Binding var humidity:String
    @StateObject private var weatherViewModel = WeatherViewModel()
    @State private var city = "Tunis"
    
    
    
    //Mark - Views
    var body: some View {
        
        VStack(alignment: .leading)
        {
            ImageView(placeholder: "Tunis", searchText: .constant(""), country: .constant("Tunisia"), city: .constant("Tunis"), degree: .constant("02"), date: .constant("25 January,Friday"), weatherDescription: .constant("Partly cloudy"))
               
            
            
            VStack(alignment: .leading)
            {
                
                
                Text("Details")
                    .font(TypefaceOne.medium.font(size: 20))
                    .foregroundColor(Color("Bluee"))
                
                
                HStack(spacing: 20)
                {
                    
                    VStack(alignment: .leading)
                    {
                        
                        Image("wind")
                            .frame(width: 14,height: 14)
                        
                        
                        Text("Wind")
                            .font(TypefaceOne.medium.font(size: 18))
                            .foregroundColor(.black)
                        
                        HStack(spacing: 4)
                        {
                            if let weather = weatherViewModel.weather {
                                Text(String(format: "%.2f", weather.current.wind_kph))
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
                        
                        Image("pressure")
                            .frame(width: 14,height: 14)
                        
                        
                        Text("pressure")
                            .font(TypefaceOne.medium.font(size: 18))
                            .foregroundColor(.black)
                        
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
                        
                        Image("humidity")
                            .frame(width: 14,height: 14)
                        
                        
                        Text("humidity")
                            .font(TypefaceOne.medium.font(size: 18))
                            .foregroundColor(.black)
                        
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
                    .padding(10) // Add padding to space the components from the stroke
                    .frame(width: 108)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color("Bluee"), lineWidth: 1)
                    )
                    
                    
                }
                
                Text("Today")
                    .font(TypefaceOne.medium.font(size: 20))
                    .foregroundColor(Color("Bluee"))
                    .padding(.top,20)
                
                
                
            
            }
            .padding(.horizontal)
        }
        .onAppear {
                    weatherViewModel.current(city: city) {
                        print(weatherViewModel.weather)
                        
                    }
                }
    }
}

#Preview {
    MainView(wind: .constant("12,5"), pressure: .constant("1000"), humidity: .constant("51"))
}
