//
//  ImageView.swift
//  weatherapp
//
//  Created by Mohamed  on 3/9/2023.
//

import Combine
import SwiftUI


struct ImageView: View {
    
    //Mark - Variables
    
    @Binding var showSidebar: Bool
    var placeholder: String
    @State var presentSideMenu = false
    @State var selectedSideMenuTab = 0
    @ObservedObject var locationManager = LocationManager()
    @StateObject private var weatherViewModel = WeatherViewModel()
    @Binding var searchText: String
    @State private var isLocationFetched = false
    
    //Mark - Views
    
    var body: some View {
        
        GeometryReader
        {
            proxy in
            let _: CGFloat = proxy.size.height
            
        
        
            ZStack(alignment: Alignment(horizontal: .leading, vertical: .top))
            {
                
                    
                
                    
               
                switch weatherViewModel.weather?.current.condition.text {
                    case "sunny":
                        Image("sunsetclear")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .edgesIgnoringSafeArea(.all)
                            .frame(width: 396, height: 380)
                    case "Partly cloudy":
                        Image("lightwind")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .edgesIgnoringSafeArea(.all)
                            .frame(width: 396, height: 336)
                    case "Cloudy":
                        Image("sunsetclouds")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .edgesIgnoringSafeArea(.all)
                            .frame(width: 396, height: 400)
                    case "Light rain":
                        Image("cold")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .edgesIgnoringSafeArea(.all)
                            .frame(width: 396, height: 400)
                    case "Heavy rain":
                        Image("rain")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .edgesIgnoringSafeArea(.all)
                            .frame(width: 396, height: 400)
                    case "Light snow":
                        Image("snow")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .edgesIgnoringSafeArea(.all)
                            .frame(width: 396, height: 400)
                    case "snow":
                        Image("snow")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .edgesIgnoringSafeArea(.all)
                            .frame(width: 396, height: 400)
                        
                        
                    default:
                        Image("sunsetclear")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .edgesIgnoringSafeArea(.all)
                            .frame(width: 396, height: 400)
                    }
                
                    
                    
                
                
                
                
                VStack()
                {
                    
                    VStack(alignment: .leading ,spacing: 10)
                    {
                        
                        HStack()
                        {
                            
                            VStack(alignment: .leading) {
                                CustomSearchBar(searchText: $searchText)
                                
                            }
                            
                            .navigationBarHidden(true)
                            
                            Spacer()
                            
                            Button(action: {
                                                withAnimation {
                                                    showSidebar.toggle()
                                                }
                                            }) {
                                                Image("alert")
                                                    .resizable()
                                                    .frame(width: 40,height: 40)
                                                    
                                            }
                            
                           
                            
                            
                        }
                        
                        HStack()
                        {
                           
                            Text("\(locationManager.city),\(locationManager.country)")
                                .font(Poppins.medium.font(size: 18))
                                .foregroundColor(.white)
                            
                            
                           
                        }
                       
                       
                        
                       }
                    .padding(.horizontal,20)
                    
                    VStack(alignment: .center ,spacing: -26)
                    {
                        
                        if let weather = weatherViewModel.weather {
                            
                            
                            
                            HStack()
                            {
                                
                                
                                Text(String(format: "%.0f", weather.current.temp_c))
                                    .foregroundColor(.white)
                                    .font(Poppins.semiBold.font(size: 130))
                                
                                
                                Text("°")
                                    .foregroundColor(.white)
                                    .font(Poppins.semiBold.font(size: 60))
                                    .padding(.bottom,50)
                                
                                
                            }
                            .padding(.leading,40)
                            
                            Text(weather.current.condition.text)
                                .font(Poppins.semiBold.font(size: 20))
                                .foregroundColor(.white)
                            
                            
                        }
                    }
                    .padding(.top,30)
                    
                    
                    
                    Text(currentFormattedDate())
                           .font(Poppins.medium.font(size: 20))
                           .foregroundColor(.white)
                           .padding(.top,50)
                           
                    
                }
                
               
                
                
               
                
                
                
            }
            .onReceive(locationManager.locationPermissionDidChange) { isPermissionGranted in
                if isPermissionGranted {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        weatherViewModel.current(city: locationManager.city) {
                            print("Data fetched")
                        }
                    }
                }
            }
            
                
               
                
            
            
            
            
            
            
        
        }
       
        
        

        
        
    }
       
    
    
    func currentFormattedDate() -> String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd MMMM, EEEE"
            return dateFormatter.string(from: Date())
    }
    
    
}



#Preview {
    ImageView(showSidebar: .constant(false), placeholder: "Tunis", searchText: .constant(""))
}
