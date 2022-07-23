//
//  FriendPhotosView.swift
//  VK(SwiftUI)
//
//  Created by Никитка on 25.01.2022.
//

import SwiftUI
import Kingfisher

struct FriendPhotosView: View {
    
    @ObservedObject var friendPhotosVM: FriendPhotosViewModel
    
    let layout = [
        GridItem(.adaptive(minimum: 170))
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: layout, spacing: 20) {
                ForEach(friendPhotosVM.photos, id: \.self) { item in
                    ZStack {
                        FriendPhotoItemView(photo: item)
                    }
                }
            }
            .padding(16)
        }
        .navigationBarTitle(friendPhotosVM.owner.name)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            friendPhotosVM.fetch()
        }
    }
}
