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
    
    @Binding var showSidebar: Bool

    
   
    
    
    
    //Mark - Views
    var body: some View {
        
        
        VStack(alignment: .leading)
        {
          
            
            ImageView(showSidebar: $showSidebar, placeholder: "Tunis", searchText: .constant(""))
               
            
                VStack()
            {
                
                DetailsView()
                    .padding(.bottom,10)
               
                TodayView()
                
            }
            .padding(.bottom,40)
            
                
                
            }
        
        
           
        
        
    }
}

#Preview {
    MainView(showSidebar: .constant(true))
}
