//
//  StandartBlueButton.swift
//  PetCard
//
//  Created by Aleksei on 03.12.2022.
//

import SwiftUI

struct StandartBlueButton: View {
    var title: String
    var action: ()-> Void
    
    var body: some View {
        Button(action: action) {
            Text("Log In")
                .frame(maxWidth: .infinity, maxHeight: 44)
                .tint(.white)
                .padding(.vertical)
        }
        .background(Color.accentColor)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

struct StandartRouteButton_Previews: PreviewProvider {
    static var previews: some View {
        LogScreenView(buttonAction: {})
    }
}
