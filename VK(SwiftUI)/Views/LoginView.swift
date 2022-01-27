//
//  LoginView.swift
//  VK(SwiftUI)
//
//  Created by Никитка on 17.01.2022.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var loginVM = LoginViewModel()
    @State private var isWrongCredentialsAlertShown = false
    @Binding var isLoggedIn: Bool
    
    var body: some View {
        ZStack {
            let colors: [Color] = [.blue, .cyan, .white]
            LinearGradient(gradient: Gradient(colors: colors),
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
                    LoginPasswordView(login: $loginVM.credentials.login,
                                      password: $loginVM.credentials.password)
                    Button(action: {
                        print("Login: \(loginVM.credentials.login)\nPassword: \(loginVM.credentials.password)")
                        loginVM.login { success in
                            isWrongCredentialsAlertShown = !success
                            isLoggedIn = success
                        }
                    }, label: {
                        Label("Sign In", systemImage: "arrow.right")
                            .font(.system(size: 18, weight: .medium))
                    })
                        .frame(width: 150, height: 40)
                        .disabled(loginVM.loginDisabled)
                        .padding(.vertical, 10)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                    if loginVM.showProgressView {
                        ProgressView()
                            .padding(.vertical, 4)
                            .foregroundColor(.secondary)
                    }
                    
                    Spacer()
                }
            }
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .disabled(loginVM.showProgressView)
            .onTapGesture {
                UIApplication.shared.endEditing()
            }
            .alert(isPresented: $isWrongCredentialsAlertShown) {
                Alert(title: Text("Error"),
                      message: Text("Please enter the correct credentials"),
                      dismissButton: .default(Text("OK"), action: {}))
            }
        }
    }
    
    private func checkCredentials(login: String, password: String) -> Bool {
        return login == "Admin" && password == "qwerty"
    }
}
