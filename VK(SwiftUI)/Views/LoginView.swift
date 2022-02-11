//
//  LoginView.swift
//  VK(SwiftUI)
//
//  Created by Никитка on 17.01.2022.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        NavigationView {
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
                        NavigationLink(
                            destination: ContainerView(),
                            label: {
                            Label("Sign In", systemImage: "arrow.right")
                                .font(.system(size: 18, weight: .medium))
                        })
                            .frame(width: 150, height: 40)
                            .padding(.vertical, 10)
                            .foregroundColor(.white)
                            .background(Color.blue)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                }
            }
        }
    }
}
