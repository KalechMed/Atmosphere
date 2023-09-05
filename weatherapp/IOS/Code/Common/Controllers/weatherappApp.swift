//
//  weatherappApp.swift
//  weatherapp
//
//  Created by Mohamed  on 3/9/2023.
//

import SwiftUI

@main
struct weatherappApp: App {
   
    
    var body: some Scene {
        WindowGroup {
            MainView(wind: .constant("12,5"), pressure: .constant("1000"), humidity: .constant("51"))
                
        }
    }
}
