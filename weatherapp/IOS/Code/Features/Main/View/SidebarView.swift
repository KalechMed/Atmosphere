//
//  SidebarView.swift
//  weatherapp
//
//  Created by Mohamed  on 10/9/2023.
//

import SwiftUI

struct SidebarView: View {
    
    @State var showSidebar: Bool = false
    
    var body: some View {
       
        
        SideBarStack(sidebarWidth: 240, showSidebar: $showSidebar) {
            
            VStack()
            {
                
                Text("hello world")
                    .foregroundColor(Color.black)
            }
            
                
                } content: {
                   
                    MainView(showSidebar: $showSidebar)
                        .padding(.top,60)
                }.edgesIgnoringSafeArea(.all)
        
    }
}

#Preview {
    SidebarView()
}
