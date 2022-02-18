//
//  FriendsViewModel.swift
//  VK(SwiftUI)
//
//  Created by Никитка on 31.01.2022.
//

import Foundation
import RealmSwift

class FriendsViewModel: ObservableObject {
    
    private var realmFriends: Results<Friend>?
    var friends: [Friend] = []
    var firstLetters: [String] = []
    let api = FriendsAPI()
    let realmService = RealmService.shared
    
    let objectWillChange = ObjectWillChangePublisher()
    var token: NotificationToken?
    
    func fetch() {
        api.getFriends { [weak self] result in
            guard let self = self else { return }
            switch result {
                case .failure(let error):
                    self.pairTableAndRealm()
                    print(error.localizedDescription)
                case .success(let friends):
                    self.friends = friends
                    self.realmService.cache(friends)
                    self.getFirstLetters()
                    self.objectWillChange.send()
            }
        }
    }
    
    private func getFirstLetters() {
        let firstLetters = friends.map({ $0.prefix })
        let lettersArray = Array(Set(firstLetters))
        self.firstLetters = lettersArray.sorted()
    }
    
    private func pairTableAndRealm() {
        guard let realm = self.realmService.realm else { return }
        self.realmFriends = realm.objects(Friend.self)
        guard let realmFriends = realmFriends else { return }
        self.friends = Array(realmFriends)
        
        self.getFirstLetters()
        self.token = realmFriends.observe { [weak self] _ in
            guard let self = self else { return }
            self.objectWillChange.send()
        }
    }
}
