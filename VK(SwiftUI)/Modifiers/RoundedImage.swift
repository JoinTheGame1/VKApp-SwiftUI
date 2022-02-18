//
//  RoundedImage.swift
//  VK(SwiftUI)
//
//  Created by Никитка on 03.02.2022.
//

import SwiftUI

struct RoundedImage: ViewModifier {
    
    let frameWidth: CGFloat
    let frameHeight: CGFloat
    let cornerRadius: CGFloat
    let borderColor: Color
    
    func body(content: Content) -> some View {
        content
            .frame(width: frameWidth, height: frameHeight)
            .cornerRadius(cornerRadius)
            .overlay(RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(borderColor, lineWidth: 1))
            .shadow(color: borderColor, radius: 5)
            
    }
}
