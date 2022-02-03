//
//  CommunitiesViewModel.swift
//  VK(SwiftUI)
//
//  Created by Никитка on 31.01.2022.
//

import Foundation
import RealmSwift

class CommunitiesViewModel: ObservableObject {
    
    private var realmCommunities: Results<Community>?
    var communities: [Community] = []
    let api: CommunitiesAPI
    let realmService = RealmService.shared
    
    let objectWillChange = ObjectWillChangePublisher()
    var token: NotificationToken?
    
    init(api: CommunitiesAPI) {
        self.api = api
    }
    
    func fetch() {
        api.getGroups { [weak self] result in
            guard let self = self else { return }
            switch result {
                case .failure(let error):
                    self.pairTableAndRealm()
                    print(error.localizedDescription)
                case .success(let communities):
                    self.communities = communities
                    self.realmService.cache(communities)
                    self.objectWillChange.send()
            }
        }
    }
    
    private func pairTableAndRealm() {
        guard let realm = self.realmService.realm else { return }
        self.realmCommunities = realm.objects(Community.self)
        guard let realmCommunities = self.realmCommunities else { return }
        self.communities = Array(realmCommunities)
        
        self.token = realmCommunities.observe { [weak self] (changes: RealmCollectionChange) in
            guard let self = self else { return }
            self.objectWillChange.send()
        }
    }
}
