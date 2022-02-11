//
//  CommunityRow.swift
//  VK(SwiftUI)
//
//  Created by Никитка on 17.01.2022.
//

import SwiftUI
import Kingfisher

struct CommunityRow: View {

    var community: Community
    
    var body: some View {
        HStack(spacing: 4) {
            KFImage(URL(string: community.photo))
                .resizable()
                .modifier(CircleAvatar(frameWidth: 52, frameHeight: 52, borderColor: .secondary))
                .padding(4)
            VStack(alignment: .leading) {
                Text(community.name)
                if !community.text.isEmpty {
                    Text(community.text)
                        .font(.system(size: 13))
                        .foregroundColor(.gray)
                        .lineLimit(2)
                }

            }
            Spacer()
        }
    }
}
