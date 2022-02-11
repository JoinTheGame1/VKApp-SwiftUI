//
//  MySession.swift
//  VK(SwiftUI)
//
//  Created by Никитка on 30.01.2022.
//

import Foundation

class MySession: ObservableObject {
    
    static let shared = MySession()
    
    private init() {}
    
    var token: String = ""
    var userId: String = ""
    @Published var isAutorized: Bool = false
}

enum APIerror: Error {
    case notData
    case decodeError
    case serverError
}
