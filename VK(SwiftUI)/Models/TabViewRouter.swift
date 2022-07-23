//
//  TabViewRouter.swift
//  VK(SwiftUI)
//
//  Created by Никитка on 08.02.2022.
//

import Foundation

enum Page {
    case news
    case messenger
    case profile
    case communities
    case friends
}

class TabViewRouter: ObservableObject {
    
    @Published var currentPage: Page = .profile
}
