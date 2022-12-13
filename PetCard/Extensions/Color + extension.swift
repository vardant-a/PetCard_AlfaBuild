//
//  UIColor + extension.swift
//  PetCard
//
//  Created by Алексей on 02.11.2022.
//

import SwiftUI

// MARK: - Color for UIKit
extension UIColor {
    static let barColor = UIColor(named: "NavBackgroundColor")
    static let backgroundColor = UIColor(named: "BackgroudAppColor")
}

// MARK: - Color for SwiftUI
extension Color {
    static let barColor = Color("NavBackgroundColor")
    static let backgroundColor = Color("BackgroudAppColor")
    static let cardColor = Color("CardColor")
}
