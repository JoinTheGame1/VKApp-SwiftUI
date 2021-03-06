//
//  RealmService.swift
//  SocialWeb
//
//  Created by Никитка on 14.10.2021.
//

import Foundation
import RealmSwift

class RealmService {
    
    static let shared = RealmService()
    var realm = try? Realm()
    
    private init() {}
    
    func cache<T: Object>(_ data: [T], param: String, filterText: String) {
        do {
            print(realm?.configuration.fileURL ?? "")
            realm?.beginWrite()
            realm?.add(data, update: .modified)
            try realm?.commitWrite()
        } catch {
            print(error)
        }
    }
    
    func cache<T: Object>(_ data: [T]) {
        do {
            print(realm?.configuration.fileURL ?? "")
            realm?.beginWrite()
            realm?.add(data, update: .modified)
            try realm?.commitWrite()
        } catch {
            print(error)
        }
    }
}
