//
//  ContentView.swift
//  VK(SwiftUI)
//
//  Created by Никитка on 13.01.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var login = ""
    @State private var password = ""
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .cyan, .white]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image("VKlogo")
                    .resizable()
                    .frame(width: 200, height: 100)
                    .scaledToFit()
                    .padding(.top, 60)
                    .padding(.bottom, 120)
                TextField("Email or phone", text: $login)
                    .padding(.leading, 40)
                    .padding(.trailing, 40)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                SecureField("Password", text: $password)
                    .padding(.leading, 40)
                    .padding(.trailing, 40)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button(action: {}, label: {
                    Text("Forgot password?")
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                })
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.trailing, 40)
                Button(action: {
                    print("Login: \(login)\nPassword: \(password)")
                }, label: {
                    Label("Sign In", systemImage: "arrow.right")
                        .font(.system(size: 18, weight: .medium))
                        .padding()
                })
                    .frame(width: 200, height: 40)
                    .padding(.top, 32)
                    .buttonStyle(.borderedProminent)
                    .tint(.blue)
                    .disabled(login.isEmpty || password.isEmpty)
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
