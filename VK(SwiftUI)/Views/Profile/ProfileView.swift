//
//  ProfileView.swift
//  VK(SwiftUI)
//
//  Created by Никитка on 26.01.2022.
//

import SwiftUI

struct ProfileView: View {
    
    @ObservedObject var accountVM: AccountViewModel
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ScrollView {
                    ZStack {
                        VStack(alignment: .trailing) {
                            Button(action: {}) {
                                Image(systemName: "gearshape")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 36, height: 36)
                                    .foregroundColor(Color("loginBg1"))
                                    .padding(.trailing, 24)
                                    .padding(.vertical, 12)
                            }
                            
                            Color(UIColor.systemBackground)
                                .cornerRadius(50)
                                .edgesIgnoringSafeArea(.all)
                        }
                        
                        AccountInfoView(account: accountVM.account)
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .edgesIgnoringSafeArea(.vertical)
                    .onAppear {
                        accountVM.fetch()
                    }
                }
                .background(Color("lightAppColor"))
                .navigationBarHidden(true)
                .navigationBarTitle(Text(""))
            }
        }
    }
}
