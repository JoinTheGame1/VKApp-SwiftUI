//
//  AccountInfoView.swift
//  VK(SwiftUI)
//
//  Created by Никитка on 09.02.2022.
//

import SwiftUI
import Kingfisher

struct AccountInfoView: View {
    
    let account: Account
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top, spacing: 0) {
                KFImage(URL(string: account.photo))
                    .resizable()
                    .scaledToFit()
                    .modifier(CircleAvatar(frameWidth: 160, frameHeight: 160))
                    .padding(.horizontal, 24)
                    .padding(.top, 10)
                VStack(alignment: .leading) {
                    Text(account.name)
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(.primary)
                        .padding(.top, 80)
                    Text("online")
                        .font(.system(size: 17))
                        .foregroundColor(Color("loginBg1"))
                        .padding(.bottom, 16)
                    Text(account.status)
                        .font(.system(size: 17))
                }
                Spacer()
            }
            .padding(.bottom, 32)
            
            Group {
                if !account.cityName.isEmpty {
                    HStack {
                        Text("City:").fontWeight(.semibold)
                        Text(account.cityName)
                        
                    }
                }
                if !account.phone.isEmpty {
                    HStack {
                        Text("Phone:").fontWeight(.semibold)
                        Button(action: {}) {
                            Text(account.phone)
                                .foregroundColor(Color("loginBg1"))
                                .underline()
                        }
                    }
                }
            }
            .padding(.leading, 24)
            Spacer()
        }
        .frame(maxWidth: .infinity)
    }
}
