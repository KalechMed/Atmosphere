//
//  FontManager.swift
//  weatherapp
//
//  Created by Mohamed  on 3/9/2023.
//

import SwiftUI


enum Poppins{
    case medium
    case semiBold
    
    func font(size :CGFloat) -> Font
    {
        switch self {
        case .medium:
            return .custom("Poppins-Medium",size:size)
        case .semiBold:
            return .custom("Poppins-SemiBold",size:size)
            
        }
    }
}
