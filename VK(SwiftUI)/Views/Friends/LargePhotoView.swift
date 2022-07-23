//
//  LargePhotoView.swift
//  VK(SwiftUI)
//
//  Created by Никитка on 07.02.2022.
//

import SwiftUI
import Kingfisher

struct LargePhotoView: View {
    
    let photo: Photo
    @State private var currentAmount: CGFloat = 0
    
    var body: some View {
        KFImage(URL(string: photo.fineSizeUrl))
            .resizable()
            .scaledToFit()
            .scaleEffect(1 + currentAmount)
            .gesture(
                MagnificationGesture()
                    .onChanged { value in
                        currentAmount = value - 1
                    }
                    .onEnded { value in
                        withAnimation(.spring()) {
                            currentAmount = 0
                        }
                    }
            )
    }
}
