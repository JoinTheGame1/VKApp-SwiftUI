//
//  FriendsViewModel.swift
//  VK(SwiftUI)
//
//  Created by Никитка on 31.01.2022.
//

import Foundation

class FriendsViewModel: ObservableObject {
    
    @Published var friends: [Friend] = []
    var firstLetters: [String] = []
    let api: FriendsAPI
    
    init(api: FriendsAPI) {
        self.api = api
    }
    
    func fetch() {
        api.getFriends { [weak self] result in
            guard let self = self else { return }
            switch result {
                case .failure(let error):
                    print(error.localizedDescription)
                case .success(let friends):
                    self.friends = friends
                    self.getFirstLetters()
            }
        }
    }
    
    func getFirstLetters() {
        let firstLetters = friends.map({ $0.prefix })
        let lettersArray = Array(Set(firstLetters))
        self.firstLetters = lettersArray.sorted()
    }
}
