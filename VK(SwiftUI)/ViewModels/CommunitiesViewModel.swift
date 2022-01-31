//
//  CommunitiesViewModel.swift
//  VK(SwiftUI)
//
//  Created by Никитка on 31.01.2022.
//

import Foundation

class CommunitiesViewModel: ObservableObject {
    
    @Published var communities: [Community] = []
    let api: CommunitiesAPI
    
    init(api: CommunitiesAPI) {
        self.api = api
    }
    
    func fetch() {
        api.getGroups { [weak self] result in
            guard let self = self else { return }
            switch result {
                case .failure(let error):
                    print(error.localizedDescription)
                case .success(let communities):
                    self.communities = communities
            }
        }
    }
}
