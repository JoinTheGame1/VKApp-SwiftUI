//
//  CommunitiesView.swift
//  VK(SwiftUI)
//
//  Created by Никитка on 25.01.2022.
//

import SwiftUI

struct CommunitiesView: View {
    
    @ObservedObject var communitiesVM: CommunitiesViewModel
    
    var body: some View {
        NavigationView {
            List(communitiesVM.communities, id: \.self) { community in
                CommunityRow(community: community)
                    .listRowSeparator(.hidden)
            }
            .listStyle(.sidebar)
            .navigationBarTitle(Text("Communities"))
            .onAppear {
                UITableView.appearance().backgroundColor = UIColor.clear
                communitiesVM.fetch()
            }
        }
    }
}
