//
//  TabBarItemView.swift
//  VK(SwiftUI)
//
//  Created by Никитка on 08.02.2022.
//

import SwiftUI

struct TabBarItemView: View {
    
    @StateObject var tabViewRouter: TabViewRouter
    let assignedPage: Page
    
    let width: CGFloat
    let height: CGFloat
    let iconName: String
    let tabName: String
    
    var body: some View {
        VStack {
            Image(systemName: tabViewRouter.currentPage == assignedPage ? "\(iconName).fill" : iconName)
                .resizable()
                .scaledToFit()
                .frame(width: width, height: height)
                .scaleEffect(0.8)
                .padding(.top, 10)
            Text(tabName)
                .font(.footnote)
            Spacer()
        }
        .padding(.horizontal, -4)
        .foregroundColor(Color("loginBg1"))
        .opacity(tabViewRouter.currentPage == assignedPage ? 1.0 : 0.7)
        .onTapGesture {
            if tabViewRouter.currentPage != assignedPage {
                tabViewRouter.currentPage = assignedPage
            }
        }
    }
}
