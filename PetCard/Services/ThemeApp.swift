//
//  ThemeApp.swift
//  PetCard
//
//  Created by Алексей on 02.11.2022.
//

import UIKit

enum ThemeStyle: Int {
    case dark = 1
    case light = 2
    case systemDefault = 3
}

extension ThemeStyle {
    var userInterfaceTheme: UIUserInterfaceStyle {
        switch self {
        case .dark:
            return .dark
        case .light:
            return .light
        case .systemDefault:
            return .unspecified
        }
    }
}

//Read from UserDefaults
let defaults = UserDefaults.standard
let themeRaw = defaults.integer(forKey: "MyTheme")
let theme = ThemeStyle(rawValue: themeRaw) ?? ThemeStyle.systemDefault

