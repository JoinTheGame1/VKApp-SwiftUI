//
//  FriendRow.swift
//  VK(SwiftUI)
//
//  Created by Никитка on 17.01.2022.
//

import SwiftUI
import Kingfisher

struct FriendRow: View {
    
    var friend: Friend
    
    var body: some View {
        HStack(spacing: 4) {
            KFImage(URL(string: friend.photo))
                .resizable()
                .modifier(CircleAvatar(frameWidth: 52, frameHeight: 52, borderColor: .secondary))
                .padding(4)
            VStack(alignment: .leading, spacing: 4) {
                Text(friend.name)
                if !friend.cityName.isEmpty {
                    Text(friend.cityName)
                        .font(.system(size: 13))
                        .foregroundColor(.gray)
                }
            }
            Spacer()
            Group {
                Button(action: {}, label: {
                    Image(systemName: "phone")
                        .resizable()
                })
                Button(action: {}, label: {
                    Image(systemName: "message")
                        .resizable()
                })
            }
            .frame(width: 24, height: 24)
            .padding(.horizontal, 8)
            .foregroundColor(.accentColor)
        }
    }
}
