//
//  LoginTFView.swift
//  PetCard
//
//  Created by Aleksei on 30.11.2022.
//

import SwiftUI

struct LoginTFView: View {
    
    @Binding var login: String
    
    var body: some View {
        TextField("Login", text: $login)
            .padding(.leading, 16)
            .frame(width: 350, height: 45)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(!login.isEmpty
                            ? Color.accentColor
                            : Color.gray,lineWidth: 2)
            )
    }
}

struct LoginTFView_Previews: PreviewProvider {
    static var previews: some View {
        LogScreenView(buttonAction: {})
    }
}
