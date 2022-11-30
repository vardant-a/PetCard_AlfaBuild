//
//  PasswordTFView.swift
//  PetCard
//
//  Created by Aleksei on 30.11.2022.
//

import SwiftUI

struct PasswordTFView: View {
    @Binding var password: String
    @State private var isVisible = false
    var body: some View {
        HStack {
            Image(systemName: "lock.circle")
            if isVisible {
                TextField("password", text: $password)
                    .frame(maxWidth: .infinity, maxHeight: 38)
            } else {
                SecureField("password", text: $password)
                    .frame(maxWidth: .infinity, maxHeight: 38)
            }
            Button(action: { isVisible.toggle()} ) {
                Image(systemName: isVisible
                      ? "eye.slash" : "eye"
                )
            }
            .opacity(password.isEmpty ? 0 : 1)
        }
        .padding(.horizontal, 8)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(password.isEmpty
                        ? (.gray)
                        : (.blue), lineWidth: 2)
                
        )
    }
}


struct PasswordTFView_Previews: PreviewProvider {
    static var previews: some View {
        LogScreenView(buttonAction: {})
    }
}
