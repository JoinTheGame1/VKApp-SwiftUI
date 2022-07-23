//
//  MainView.swift
//  VK(SwiftUI)
//
//  Created by Никитка on 25.01.2022.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var tabViewRouter: TabViewRouter
    
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width / 5
            let height = geometry.size.height / 28
            ZStack {
                switch tabViewRouter.currentPage {
                    case .news:
                        NewsView()
                    case .messenger:
                        Text("Messenger")
                    case .profile:
                        ProfileView(accountVM: AccountViewModel())
                    case .communities:
                        CommunitiesView(communitiesVM: CommunitiesViewModel())
                    case .friends:
                        FriendsView(friendsVM: FriendsViewModel())
                }
                VStack(spacing: 0) {
                    Spacer()
                    HStack {
                        TabBarItemView(tabViewRouter: tabViewRouter, assignedPage: .news, width: width, height: height, iconName: "newspaper", tabName: "News")
                        TabBarItemView(tabViewRouter: tabViewRouter, assignedPage: .messenger, width: width, height: height, iconName: "message", tabName: "Messenger")
                        TabBarItemView(tabViewRouter: tabViewRouter, assignedPage: .profile, width: width, height: height, iconName: "person", tabName: "Profile")
                        TabBarItemView(tabViewRouter: tabViewRouter, assignedPage: .communities, width: width, height: height, iconName: "person.3", tabName: "Communities")
                        TabBarItemView(tabViewRouter: tabViewRouter, assignedPage: .friends, width: width, height: height, iconName: "person.2", tabName: "Friends")
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height / 8)
                    .background(.ultraThinMaterial)
                    .cornerRadius(20)
                }
                .edgesIgnoringSafeArea(.bottom)
            }
            
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}


