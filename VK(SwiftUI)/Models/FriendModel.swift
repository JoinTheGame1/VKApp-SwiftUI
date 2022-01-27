//
//  FriendModel.swift
//  VK(SwiftUI)
//
//  Created by Никитка on 25.01.2022.
//

import Foundation

class Friend: Identifiable {
    var lastName: String
    var firstName: String
    var name: String { return lastName + " " + firstName}
    var prefix: String { return String(lastName.first ?? " ") }
    var id: String { return name }
    var avatarName: String
    var city: String
    var photos: [String]
    
    internal init(lastName: String, firstName: String, avatarName: String, city: String, photos: [String]) {
        self.firstName = firstName
        self.lastName = lastName
        self.avatarName = avatarName
        self.city = city
        self.photos = photos
    }
}

struct FriendsStorage {
    static let friends = [
        Friend(lastName: "Hollow", firstName: "Knight", avatarName: "hollow knight", city: "Hallownest", photos: ["hollow knight", "hollow knight1", "hollow knight2", "hollow knight3"]),
        Friend(lastName: "Snape", firstName: "Severus", avatarName: "severus", city: "Great Britain", photos: ["severus", "severus", "severus"]),
        Friend(lastName: "Hollow", firstName: "Knight", avatarName: "hollow knight", city: "Hallownest", photos: ["hollow knight", "hollow knight", "hollow knight"]),
        Friend(lastName: "Snape", firstName: "Severus", avatarName: "severus", city: "Great Britain", photos: ["severus", "severus", "severus"]),
        Friend(lastName: "Hollow", firstName: "Knight", avatarName: "hollow knight", city: "Hallownest", photos: ["hollow knight", "hollow knight", "hollow knight"]),
        Friend(lastName: "Snape", firstName: "Severus", avatarName: "severus", city: "Great Britain", photos: ["severus", "severus", "severus"]),
        Friend(lastName: "Hollow", firstName: "Knight", avatarName: "hollow knight", city: "Hallownest", photos: ["hollow knight", "hollow knight", "hollow knight"]),
        Friend(lastName: "Snape", firstName: "Severus", avatarName: "severus", city: "Great Britain", photos: ["severus", "severus", "severus"]),
        Friend(lastName: "Hollow", firstName: "Knight", avatarName: "hollow knight", city: "Hallownest", photos: ["hollow knight", "hollow knight", "hollow knight"]),
        Friend(lastName: "Snape", firstName: "Severus", avatarName: "severus", city: "Great Britain", photos: ["severus", "severus", "severus"]),
        Friend(lastName: "Hollow", firstName: "Knight", avatarName: "hollow knight", city: "Hallownest", photos: ["hollow knight", "hollow knight", "hollow knight"]),
        Friend(lastName: "Snape", firstName: "Severus", avatarName: "severus", city: "Great Britain", photos: ["severus", "severus", "severus"]),
    ]
    
    static let firstLetters: [String] = {
        let firstLetters = friends.map{ $0.prefix }
        return Array(Set(firstLetters)).sorted()
    }()
}
