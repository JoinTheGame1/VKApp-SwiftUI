//
//  LoginView.swift
//  VK(SwiftUI)
//
//  Created by Никитка on 17.01.2022.
//

import SwiftUI

struct LoginView: View {
    
    let colors: [Color] = [Color("loginBg1"), Color("loginBg2")]
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: colors),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            GeometryReader { geometry in
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        Image("VKlogo")
                            .resizable()
                            .frame(width: 200, height: 120)
                            .scaledToFit()
                            .padding(.top, 60)
                        Spacer(minLength: 40)
                        NavigationLink(
                            destination: VKLoginWebView(),
                            label: {
                                Text("Sign In")
                                    .font(.system(size: 17, weight: .medium))
                            })
                            .frame(width: 280, height: 50)
                            .foregroundColor(.black)
                            .background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 25))
                        Spacer()
                        HStack {
                            Text("Don't have an account?")
                            Button(action: {}) {
                                Text("SIGN UP")
                                    .underline()
                            }
                        }
                        .foregroundColor(.black)
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .edgesIgnoringSafeArea(.vertical)
                }
                .navigationViewStyle(StackNavigationViewStyle())
                .navigationBarHidden(true)
                .navigationBarTitle(Text(""))
            }
        }
    }
}
