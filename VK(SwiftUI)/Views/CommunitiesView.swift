//
//  CommunitiesView.swift
//  VK(SwiftUI)
//
//  Created by Никитка on 25.01.2022.
//

import SwiftUI

struct CommunitiesView: View {
    let communities = CommunitiesStorage.communities
    
    var body: some View {
        NavigationView {
            List(communities) { community in
                CommunityRow(community: community)
            }
            .listStyle(.sidebar)
            .navigationBarTitle(Text("Communities"))
        }
    }
}
