//
//  AccountModel.swift
//  VK(SwiftUI)
//
//  Created by Никитка on 08.02.2022.
//

import Foundation
import RealmSwift

struct AccountResponse: Codable {
    let response: [Account]
}

class Account: Object, Codable {
    
    @objc dynamic var id: Int = 0
    @objc dynamic var lastName: String = ""
    @objc dynamic var firstName: String = ""
    @objc dynamic var city: City?
    @objc dynamic var photo: String = ""
    @objc dynamic var status: String = ""
    @objc dynamic var phone: String = ""
    @objc dynamic var counters: Counters?
    
    var name: String { return firstName + " " + lastName }
    var cityName: String { return city?.title ?? "" }
    
    enum CodingKeys: String, CodingKey {
        case id
        case lastName = "last_name"
        case firstName = "first_name"
        case city
        case photo = "photo_200"
        case status
        case phone = "mobile_phone"
    }
    
    override class func primaryKey() -> String? {
        return "id"
    }
}

class Counters: Object, Codable {
    
    @objc dynamic var friends: Int = 0
    @objc dynamic var followers: Int = 0
    @objc dynamic var communities: Int = 0
    
    enum CodingKeys: String, CodingKey {
        case friends
        case followers
        case communities = "groups"
    }
}
