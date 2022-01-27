//
//  LoginViewModel.swift
//  VK(SwiftUI)
//
//  Created by Никитка on 18.01.2022.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var credentials = Credentials()
    @Published var showProgressView = false
    @Published var authenticationIsValidated = false
    
    let apiService = APIService()
    var loginDisabled: Bool {
        credentials.login.isEmpty || credentials.password.isEmpty
    }
    
    func login(completion: @escaping (Bool) -> Void) {
        showProgressView = true
        apiService.login(credentials: credentials) { [unowned self] result in
            showProgressView = false
            switch result {
            case .success:
                authenticationIsValidated = true
                completion(true)
            case .failure:
                credentials.password = ""
                authenticationIsValidated = false
                completion(false)
            }
        }
    }
}
