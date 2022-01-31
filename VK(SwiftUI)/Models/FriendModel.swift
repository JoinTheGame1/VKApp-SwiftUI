//
//  FriendModel.swift
//  SocialWeb
//
//  Created by Никитка on 11.06.2021.
//

import Foundation
import RealmSwift

// MARK: - Friends
struct Friends: Codable {
    let count: Int
    let items: [Friend]
}

// MARK: - Friend
class Friend: Object, Codable, ProfileRepresentable {
    
    @objc dynamic var id: Int = 0
    @objc dynamic var lastName: String = ""
    @objc dynamic var firstName: String = ""
    @objc dynamic var city: City?
    @objc dynamic var photo: String = ""
    
    var name: String { return firstName + " " + lastName } 
    var prefix: String { return String(lastName.first ?? " ") }
    var cityName: String { return city?.title ?? "" }

    enum CodingKeys: String, CodingKey {
        case id
        case lastName = "last_name"
        case firstName = "first_name"
        case city
        case photo = "photo_100"
    }
    
    override class func primaryKey() -> String? {
        return "id"
    }
}

class City: Object, Codable {
    @objc dynamic var id: Int = 0
    @objc dynamic var title: String = ""
}
