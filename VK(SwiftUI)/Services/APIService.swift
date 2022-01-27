//
//  APIService.swift
//  VK(SwiftUI)
//
//  Created by Никитка on 18.01.2022.
//

import Foundation

class APIService {
    enum APIError: Error {
        case error
    }
    
    func login(credentials: Credentials, completion: @escaping (Result<Bool, APIError>) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            if credentials.login == "Admin" && credentials.password == "1234" {
                completion(.success(true))
            } else {
                completion(.failure(APIError.error))
            }
        }
    }
}
