//
//  ContainerView.swift
//  VK(SwiftUI)
//
//  Created by Никитка on 25.01.2022.
//

import SwiftUI

struct ContainerView: View {
    @State private var shouldShowMainView: Bool = true
    
    var body: some View {
        NavigationView {
            HStack {
                LoginView(isLoggedIn: $shouldShowMainView)
            }
            .fullScreenCover(isPresented: $shouldShowMainView, onDismiss: nil) {
                MainView()
            }
        }
    }
}
