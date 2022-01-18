//
//  CircleAvatar.swift
//  VK(SwiftUI)
//
//  Created by Никитка on 18.01.2022.
//

import Foundation
import SwiftUI

struct CircleAvatar: ViewModifier {
    
    let frameWidth: CGFloat
    let frameHeight: CGFloat
    let borderColor: Color
    
    func body(content: Content) -> some View {
        content
            .frame(width: frameWidth, height: frameHeight)
            .clipShape(Circle())
            .overlay(Circle().stroke(borderColor, lineWidth: 1))
            .shadow(color: borderColor, radius: 5)
            
    }
}
