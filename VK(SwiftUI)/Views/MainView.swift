//
//  MainView.swift
//  VK(SwiftUI)
//
//  Created by Никитка on 25.01.2022.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
            FriendsView(friendsVM: FriendsViewModel(api: FriendsAPI()))
                .tabItem {
                    Image(systemName: "person.2")
                    Text("Friends")
                }
            CommunitiesView(communitiesVM: CommunitiesViewModel(api: CommunitiesAPI()))
                .tabItem {
                    Image(systemName: "person.3")
                    Text("Communities")
                }
            NewsView()
                .tabItem {
                    Image(systemName: "newspaper")
                    Text("News")
                }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle("", displayMode: .automatic)
        .navigationBarHidden(true)
    }
}
