//
//  CustomSearchBar.swift
//  weatherapp
//
//  Created by Mohamed  on 3/9/2023.
//

import SwiftUI

struct CustomSearchBar: View {
    
    //Mark - Variables
    
    @Binding var searchText: String
    
    //Mark - Views
    
    var body: some View {
        ZStack(alignment: .leading) {
                    TextField("", text: $searchText)
                        .padding(12)
                        .background(Color.clear)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.white, lineWidth: 1.5)
                        )
                        .foregroundColor(.black)
                        .frame(width: 300)
                    
                    Image("chercher")
                        .padding(.leading, 20)
            
                }
                
                
        
    }
}

#Preview {
    CustomSearchBar(searchText: .constant(""))
    
}

