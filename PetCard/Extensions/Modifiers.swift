//
//  Modifiers.swift
//  PetCard
//
//  Created by Алексей on 20.11.2022.
//

import SwiftUI

// MARK: - Create Card Shell
struct CardShell: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 352, height: 220)
            .background(Color.yellow)
            .cornerRadius(12)
    }
}
