//
//  CommunityModel.swift
//  VK(SwiftUI)
//
//  Created by Никитка on 25.01.2022.
//

import Foundation

class Community: Identifiable {
    var id: String { return name }
    var name: String
    var description: String
    var avatarName: String
    
    internal init(name: String, description: String, avatarName: String) {
        self.name = name
        self.description = description
        self.avatarName = avatarName
    }
}

struct CommunitiesStorage {
    static let communities = [
        Community(name: "Quantum Mechanics", description: "Quantum mechanics is a fundamental theory in physics that provides a description of the physical properties of nature at the scale of atoms and subatomic particles", avatarName: "quantum mechanics"),
        Community(name: "Quantum Mechanics", description: "Quantum mechanics is a fundamental theory in physics that provides a description of the physical properties of nature at the scale of atoms and subatomic particles", avatarName: "quantum mechanics"),
        Community(name: "Quantum Mechanics", description: "Quantum mechanics is a fundamental theory in physics that provides a description of the physical properties of nature at the scale of atoms and subatomic particles", avatarName: "quantum mechanics"),
        Community(name: "Quantum Mechanics", description: "Quantum mechanics is a fundamental theory in physics that provides a description of the physical properties of nature at the scale of atoms and subatomic particles", avatarName: "quantum mechanics"),
        Community(name: "Quantum Mechanics", description: "Quantum mechanics is a fundamental theory in physics that provides a description of the physical properties of nature at the scale of atoms and subatomic particles", avatarName: "quantum mechanics"),
        Community(name: "Quantum Mechanics", description: "Quantum mechanics is a fundamental theory in physics that provides a description of the physical properties of nature at the scale of atoms and subatomic particles", avatarName: "quantum mechanics")
    ]
}
