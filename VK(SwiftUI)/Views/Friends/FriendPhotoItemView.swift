//
//  FriendPhotoItemView.swift
//  VK(SwiftUI)
//
//  Created by Никитка on 03.02.2022.
//

import SwiftUI
import Kingfisher

struct FriendPhotoItemView: View {
    
    let photo: Photo
    @State private var isLiked: Bool
    @State private var count: Int
    
    init(photo: Photo) {
        self.photo = photo
        self.isLiked = self.photo.likes?.liked ?? false
        self.count = self.photo.likes?.count ?? 0
    }
    
    var body: some View {
        VStack {
            NavigationLink(destination: LargePhotoView(photo: photo)) {
                KFImage(URL(string: photo.fineSizeUrl))
                    .resizable()
                    .scaledToFill()
                    .modifier(RoundedImage(frameWidth: 170,
                                           frameHeight: 170,
                                           cornerRadius: 12,
                                           borderColor: .secondary))
            }
            
            HStack {
                Image(systemName: isLiked ? "heart.fill" : "heart")
                Text("\(count)")
            }
            .foregroundColor(isLiked ? .pink : .gray)
            .font(.system(size: 20))
            .onTapGesture {
                withAnimation(.easeInOut(duration: 0.3)) {
                    self.isLiked.toggle()
                    self.count = self.isLiked ? self.count + 1 : self.count - 1
                }
            }
        }
    }
}
