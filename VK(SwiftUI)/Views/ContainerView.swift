//
//  ContainerView.swift
//  VK(SwiftUI)
//
//  Created by Никитка on 25.01.2022.
//

import SwiftUI
import RealmSwift

struct ContainerView: View {
    @ObservedObject var session = MySession.shared
    
    var body: some View {
        NavigationView {
            HStack {
                VKLoginWebView()
            }
            .fullScreenCover(isPresented: $session.isAutorized, onDismiss: nil) {
                MainView()
            }
        }
    }
}
