//
//  UIApplication+Extension.swift
//  VK(SwiftUI)
//
//  Created by Никитка on 18.01.2022.
//

import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIApplication.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
