//
//  PhotosAPI.swift
//  VK(SwiftUI)
//
//  Created by Никитка on 30.01.2022.
//

import Foundation
import Alamofire

final class PhotosAPI {
    
    let baseUrl = "https://api.vk.com/method"
    let token = MySession.shared.token
    let version = "5.131"
    
    func getPhotos(whom userId: String, completion: @escaping (Result<[Photo], APIerror>) -> Void) {
        let method = "/photos.getAll"
        
        let parameters: Parameters = [
            "owner_id": userId,
            "extended": 1,
            "count": 100,
            "access_token": token,
            "v": version
            ]
        
        let url = baseUrl + method
        
        AF.request(url, method: .get, parameters: parameters).responseJSON { response in
            
            if let error = response.error {
                completion(.failure(.serverError))
                print(error)
            }
            
            guard let data = response.data else {
                completion(.failure(.notData))
                return
            }
            
            do {
                let responsePhotos = try JSONDecoder().decode(Response<Photo>.self, from: data)
                let photos = responsePhotos.response.items
                completion(.success(photos))
            } catch {
                completion(.failure(.decodeError))
            }
        }
    }
}
