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
    @State private var imageTapped: Bool = false
    
    var body: some View {
        HStack(spacing: 4) {
            KFImage(URL(string: friend.photo))
                .resizable()
                .modifier(CircleAvatar(frameWidth: 52,
                                       frameHeight: 52,
                                       borderColor: .secondary))
                .padding(4)
                .scaleEffect(imageTapped ? 1.2 : 1)
                .onTapGesture {
                    withAnimation(animation()) {
                        imageTapped.toggle()
                    }
                }
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
                Button(action: {
                    print("Call a \(friend.name)")
                }, label: {
                    Image(systemName: "phone")
                        .resizable()
                })
                Button(action: {
                    print("Message to \(friend.name)")
                }, label: {
                    Image(systemName: "message")
                        .resizable()
                })
            }
            .frame(width: 24, height: 24)
            .padding(.horizontal, 8)
            .foregroundColor(.accentColor)
        }
    }
    
    func animation() -> Animation {
        self.imageTapped.toggle()
        return Animation
            .spring(response: 0.5, dampingFraction: 0.7, blendDuration: 0)
            .speed(2)
    }
}
