//
//  NewsAPI.swift
//  VK(SwiftUI)
//
//  Created by Никитка on 30.01.2022.
//

import Foundation
import Alamofire

class NewsAPI {
    
    let baseUrl = "https://api.vk.com/method"
    let token = MySession.shared.token
    let version = "5.131"
    
    func getDataNews(_ nextFrom: String = "next_from", completion: @escaping (Result<News, APIerror>) -> Void) {
        let method = "/newsfeed.get"

        let parameters: Parameters = [
            "filters": "post, photo",
            "access_token": token,
            "v": version,
            "count": 20,
            "start_from": nextFrom
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
                let responseNews = try JSONDecoder().decode(NewsResponse.self, from: data)
                let news = responseNews.response
                completion(.success(news))
            } catch {
                completion(.failure(.decodeError))
            }
        }
        
    }
}
