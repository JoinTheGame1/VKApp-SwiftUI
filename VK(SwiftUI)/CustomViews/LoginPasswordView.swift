//
//  LoginPasswordView.swift
//  VK(SwiftUI)
//
//  Created by Никитка on 18.01.2022.
//

import SwiftUI

struct LoginPasswordView: View {
    @Binding var login: String
    @Binding var password: String
    
    var body: some View {
        Group {
            TextField("Email or phone", text: $login)
            SecureField("Password", text: $password)
        }
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .padding(.horizontal, 40)
        
        Button(action: {}, label: {
            Text("Forgot password?")
                .fontWeight(.medium)
                .foregroundColor(.white)
        })
            .frame(maxWidth: .infinity, alignment: .trailing)
            .padding(.trailing, 40)
            .padding(.bottom, 40)
    }
}
