//
//  FriendPhotosView.swift
//  VK(SwiftUI)
//
//  Created by Никитка on 25.01.2022.
//

import SwiftUI

struct FriendPhotosView: View {
    var friend: Friend
    let layout = [
        GridItem(.adaptive(minimum: 120))
    ]
    
    var body: some View {
        ScrollView {
//            LazyVGrid(columns: layout, spacing: 20) {
//                ForEach(friend.photos, id: \.self) { item in
//                    Image(item)
//                        .resizable()
//                        .scaledToFill()
//                        .frame(width: 120, height: 120)
//                        .clipShape(Rectangle())
//                        .cornerRadius(12)
//                }
//            }
//            .padding(16)
            Text("Photo")
        }
        .navigationBarTitle(friend.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}
