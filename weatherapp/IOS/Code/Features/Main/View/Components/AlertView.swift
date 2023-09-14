//
//  AlertView.swift
//  weatherapp
//
//  Created by Mohamed  on 11/9/2023.
//

import SwiftUI


//Mark - Variables



//Mark - Views
struct AlertView: View {
    var body: some View {
        
        
        GeometryReader
        {
            proxy in
            let _: CGFloat = proxy.size.height
            
            VStack(alignment: .leading)
            {
                
                HStack(spacing: 20)
                {
                    Image("RedAlert")
                        .resizable()
                        .frame(width: 30, height: 30)
                    
                    Text("Alerts")
                        .font(Poppins.medium.font(size: 30))
                        .foregroundColor(.black)
                    
                    
                }
                .padding(.bottom,30)
                
                
                VStack(alignment: .leading,spacing: 20)
                {
                    
                    VStack(alignment: .leading,spacing: 10)
                    {
                        HStack(spacing: 14)
                        {
                            
                            Image("flood")
                                .resizable()
                                .frame(width:22,height: 22)
                            Text("Flood warning")
                                .font(Poppins.medium.font(size: 22))
                                .foregroundColor(.black)
                        }
                        
                        HStack(spacing: 20)
                        {
                            HStack(spacing: 10)
                            {
                                Image("calendar")
                                    .resizable()
                                    .frame(width:14,height: 14)
                                Text("2023-09-14")
                                    .font(Poppins.medium.font(size: 16))
                                    . foregroundColor(Color("SubColor"))
                            }
                            
                            HStack(spacing: 10)
                            {
                                Image("time")
                                    .resizable()
                                    .frame(width:14,height: 14)
                                Text("05:00")
                                    .font(Poppins.medium.font(size: 16))
                                    .foregroundColor(Color("SubColor"))
                            }
                        }
                    }
                    
                    
                    Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry.")
                        .font(Poppins.medium.font(size: 16))
                        .foregroundColor(.black)
                }
                
                .padding(.horizontal,18)
                .padding(.vertical,20)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(Color("bg"))
                )
            }
            .padding()
            .padding(.top,80)
        }
    }
}

#Preview {
    AlertView()
}
