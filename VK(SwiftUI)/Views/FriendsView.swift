//
//  FriendsView.swift
//  VK(SwiftUI)
//
//  Created by Никитка on 25.01.2022.
//

import SwiftUI

struct FriendsView: View {
    let friends = FriendsStorage.friends
    let firstLetters = FriendsStorage.firstLetters
    
    var body: some View {
        NavigationView {
            List(firstLetters, id: \.self) { letter in
                Section(header: Text(letter).font(.title)) {
                    ForEach(friends) { friend in
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
                }
                .listStyle(.sidebar)
                .navigationBarTitle(Text("Friends"))
            }
        }
    }
}
