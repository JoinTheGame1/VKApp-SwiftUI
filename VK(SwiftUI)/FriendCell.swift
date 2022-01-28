//
//  FriendCell.swift
//  VK(SwiftUI)
//
//  Created by Никитка on 17.01.2022.
//

import SwiftUI

struct FriendCell: View {
    var body: some View {
        HStack(spacing: 12) {
            Image("hollow knight")
                .resizable()
                .modifier(CircleAvatar(frameWidth: 52, frameHeight: 52, borderColor: .secondary))
                .padding(.horizontal)
            VStack(alignment: .leading, spacing: 4) {
                Text("Hollow Knight")
                Text("Hallownest")
                    .font(.system(size: 13))
                    .foregroundColor(.gray)
            }
            Spacer()
            Button(action: {}, label: {
                Image(systemName: "phone")
                    .resizable()
                    .frame(width: 24, height: 24)
            })
            Button(action: {}, label: {
                Image(systemName: "message")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .padding(.horizontal)
            })
        }
    }
}
