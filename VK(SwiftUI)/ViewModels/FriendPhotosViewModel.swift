//
//  FriendPhotosViewModel.swift
//  VK(SwiftUI)
//
//  Created by Никитка on 03.02.2022.
//

import Foundation

class FriendPhotosViewModel: ObservableObject {
    
    @Published var photos: [Photo] = []
    let owner: Friend
    private let api = PhotosAPI()
    
    init(owner: Friend) {
        self.owner = owner
    }
    
    func fetch() {
        api.getPhotos(whom: String(owner.id)) { [weak self] result in
            guard let self = self else { return }
            switch result {
                case .failure(let error):
                    print(error.localizedDescription)
                case .success(let photos):
                    self.photos = photos
            }
        }
    }
}
