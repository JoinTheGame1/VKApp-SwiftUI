//
//  LoginView.swift
//  VK(SwiftUI)
//
//  Created by Никитка on 17.01.2022.
//

import SwiftUI

struct LoginView: View {
    @State private var login = ""
    @State private var password = ""
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .cyan, .white]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    Image("VKlogo")
                        .resizable()
                        .frame(width: 200, height: 120)
                        .scaledToFit()
                        .padding(.top, 60)
                        .padding(.bottom, 120)
                    TextField("Email or phone", text: $login)
                        .padding(.horizontal, 40)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    SecureField("Password", text: $password)
                        .padding(.horizontal, 40)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button(action: {}, label: {
                        Text("Forgot password?")
                            .fontWeight(.medium)
                            .foregroundColor(.white)
                    })
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding(.trailing, 40)
                        .padding(.bottom, 40)
                    Button(action: {
                        print("Login: \(login)\nPassword: \(password)")
                    }, label: {
                        Label("Sign In", systemImage: "arrow.right")
                            .font(.system(size: 18, weight: .medium))
                    })
                    
                        .frame(width: 150, height: 40)
                        .padding(.vertical, 10)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .disabled(login.isEmpty || password.isEmpty)
                    Spacer()
                }
            }
            .onTapGesture {
                UIApplication.shared.endEditing()
            }
        }
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIApplication.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
