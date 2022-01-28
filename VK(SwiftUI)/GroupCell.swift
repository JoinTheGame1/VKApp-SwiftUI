//
//  GroupCell.swift
//  VK(SwiftUI)
//
//  Created by Никитка on 17.01.2022.
//

import SwiftUI

struct GroupCell: View {
    var body: some View {
        HStack(spacing: 12) {
            Image("quantum mechanics")
                .resizable()
                .modifier(CircleAvatar(frameWidth: 52, frameHeight: 52, borderColor: .secondary))
                .padding(.horizontal)
            VStack(alignment: .leading) {
                Text("Quantum Mechanics")
                Text("Quantum mechanics is a fundamental theory in physics that provides a description of the physical properties of nature at the scale of atoms and subatomic particles")
                    .font(.system(size: 13))
                    .foregroundColor(.gray)
                    .lineLimit(2)
            }
            Spacer()
            
        }
    }
}
