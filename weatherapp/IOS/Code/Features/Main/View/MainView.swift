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
    
   
    
   
    
    
    
    //Mark - Views
    var body: some View {
        
        
        VStack(alignment: .leading)
        {
            ImageView(placeholder: "Tunis", searchText: .constant("") )
               
            
                
                DetailsView()
                
                
                
                TodayView()
                
            }
        
           
        
        
    }
}

#Preview {
    MainView()
}
