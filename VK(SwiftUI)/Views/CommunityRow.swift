//
//  CommunityRow.swift
//  VK(SwiftUI)
//
//  Created by Никитка on 17.01.2022.
//

import SwiftUI

struct CommunityRow: View {
    var community: Community
    
    var body: some View {
        HStack(spacing: 4) {
            Image(community.avatarName)
                .resizable()
                .modifier(CircleAvatar(frameWidth: 52, frameHeight: 52, borderColor: .secondary))
                .padding(4)
            VStack(alignment: .leading) {
                Text(community.name)
                Text(community.description)
                    .font(.system(size: 13))
                    .foregroundColor(.gray)
                    .lineLimit(2)
            }
            Spacer()
        }
    }
}
