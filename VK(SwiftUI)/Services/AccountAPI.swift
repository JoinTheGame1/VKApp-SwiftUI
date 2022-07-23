//
//  AccountAPI.swift
//  VK(SwiftUI)
//
//  Created by Никитка on 08.02.2022.
//

import Foundation
import Alamofire

class AccountAPI {
    
    let baseUrl = "https://api.vk.com/method"
    let token = MySession.shared.token
    let version = "5.131"
    
    func getAccountInfo(completion: @escaping (Result<Account, APIerror>) -> Void) {
        let method = "/users.get"
        
        let parameters: Parameters = [
            "fields": "photo_200, status, counters, contacts, city",
            "name_case": "nom",
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
                let response = try JSONDecoder().decode(AccountResponse.self, from: data)
                if let account = response.response.first {
                    completion(.success(account))
                }
            } catch {
                completion(.failure(.decodeError))
            }
        }
    }
}
