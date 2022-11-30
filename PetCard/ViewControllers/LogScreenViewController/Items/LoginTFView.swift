//
//  LoginTFView.swift
//  PetCard
//
//  Created by Aleksei on 30.11.2022.
//

import SwiftUI

struct LoginTFView: View {
    
    @Binding var login: String
    var action: ()-> Void
    var body: some View {
        HStack {
            Image(systemName: "person.circle")
            TextField("name", text: $login)
                .frame(maxWidth: .infinity, maxHeight: 38)
        }
        .padding(.horizontal, 8)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(login.isEmpty
                        ? (.gray)
                        : (.blue), lineWidth: 2)
        )
    }
}

struct LoginTFView_Previews: PreviewProvider {
    static var previews: some View {
        LogScreenView(buttonAction: {})
    }
}
