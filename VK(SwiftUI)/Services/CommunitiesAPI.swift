//
//  CommunitiesAPI .swift
//  VK(SwiftUI)
//
//  Created by Никитка on 30.01.2022.
//

import Foundation
import Alamofire
import RealmSwift

final class CommunitiesAPI {
    
    let baseUrl = "https://api.vk.com/method"
    let token = MySession.shared.token
    let userId = MySession.shared.userId
    let version = "5.131"
    
    func getGroups(completion: @escaping (Result<[Community], APIerror>) -> Void) {
        let method = "/groups.get"
        
        let parameters: Parameters = [
            "user_id": userId,
            "extended": 1,
            "count": 1000,
            "fields": "description",
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
                let responseCommunities = try JSONDecoder().decode(Response<Community>.self, from: data)
                let communities = responseCommunities.response.items
                completion(.success(communities))
            } catch {
                completion(.failure(.decodeError))
            }
        }
    }
    
    func getSearchGroups(with text: String, completion: @escaping (Result<[Community], APIerror>) -> Void) {
        let method = "/groups.search"
        
        let parameters: Parameters = [
            "count": 1000,
            "access_token": token,
            "v": version,
            "q": text
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
                let responseSearchCommunities = try JSONDecoder().decode(Response<Community>.self, from: data)
                let searchCommunities = responseSearchCommunities.response.items
                completion(.success(searchCommunities))
            } catch {
                completion(.failure(.decodeError))
            }
        }
    }
}
