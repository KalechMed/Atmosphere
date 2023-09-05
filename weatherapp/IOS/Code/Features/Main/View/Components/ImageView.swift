//
//  ImageView.swift
//  weatherapp
//
//  Created by Mohamed  on 3/9/2023.
//

import Combine
import SwiftUI


struct ImageView: View {
    
    var placeholder: String
    @ObservedObject var locationManager = LocationManager()

    
    
    @Binding var searchText: String
    @Binding var country:String
    @Binding var city:String
    @Binding var degree:String
    @Binding var date:String
    @Binding var weatherDescription:String
    

    
    var body: some View {
        
        GeometryReader
        {
            proxy in
            let _: CGFloat = proxy.size.height
            
        
        
            ZStack(alignment: Alignment(horizontal: .leading, vertical: .top))
            {
                Image("snow")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                    .frame(height: 480)
                    
        
                
                
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
                            
                            Image("menu-burger")
                            
                        }
                        
                        HStack()
                        {
                           
                            Text("\(locationManager.city),\(locationManager.country)")
                                                       .font(TypefaceOne.medium.font(size: 18))
                                                       .foregroundColor(.white)
                            
                            
                            
                        }
                       }
                    .padding(.horizontal,20)
                    
                    VStack(alignment: .center ,spacing: -26)
                    {
                        Text(degree)
                            .foregroundColor(.white)
                            .font(TypefaceOne.semiBold.font(size: 130))
                        
                        Text(weatherDescription)
                            .font(TypefaceOne.semiBold.font(size: 20))
                            .foregroundColor(.white)
                        
                        
                    }
                    .padding(.top,30)
                    
                    
                    Text(currentFormattedDate())
                           .font(TypefaceOne.medium.font(size: 20))
                           .foregroundColor(.white)
                           .padding(.top,100)
                           
                    
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
    ImageView(placeholder: "Tunis", searchText: .constant(""), country: .constant("Tunisia"), city: .constant("Tunis"), degree: .constant("02"), date: .constant("25 January,Friday"), weatherDescription: .constant("Partly cloudy"))
}
