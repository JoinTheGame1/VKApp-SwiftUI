//
//  FriendsView.swift
//  VK(SwiftUI)
//
//  Created by Никитка on 25.01.2022.
//

import SwiftUI

struct FriendsView: View {
    
    @ObservedObject var friendsVM: FriendsViewModel
    
    var body: some View {
        NavigationView {
            List(friendsVM.firstLetters, id: \.self) { letter in
                Section(header: Text(letter).font(.title)) {
                    ForEach(friendsVM.friends, id: \.self) { friend in
                        if friend.prefix == letter {
                            ZStack {
                                FriendRow(friend: friend)
                                NavigationLink(destination: FriendPhotosView(friend: friend)) {
                                    EmptyView()
                                }
                                .opacity(0)
                            }
                        }
                    }
                    .listRowSeparator(.hidden)
                }
            }
            .listStyle(.sidebar)
            .navigationBarTitle(Text("Friends"))
            .onAppear {
                friendsVM.fetch()
            }
        }
    }
}
