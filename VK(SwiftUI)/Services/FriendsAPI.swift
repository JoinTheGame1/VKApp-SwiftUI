//
//  FriendsAPI.swift
//  VK(SwiftUI)
//
//  Created by Никитка on 30.01.2022.
//

import Foundation
import Alamofire
import Realm

final class FriendsAPI {
    
    let baseUrl = "https://api.vk.com/method"
    let token = MySession.shared.token
    let userId = MySession.shared.userId
    let version = "5.131"
    
    func getFriends(completion: @escaping (Result<[Friend], APIerror>) -> Void) {
        let method = "/friends.get"
        
        let parameters: Parameters = [
            "user_id": userId,
            "order": "hints",
            "count": 1000,
            "fields": "city, photo_100",
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
                let responseFriends = try JSONDecoder().decode(Response<Friend>.self, from: data)
                let friends = responseFriends.response.items
                completion(.success(friends))
            } catch {
                completion(.failure(.decodeError))
            }
        }
    }
}
