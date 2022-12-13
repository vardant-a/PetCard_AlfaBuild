//
//  PasswordTFView.swift
//  PetCard
//
//  Created by Aleksei on 30.11.2022.
//

import SwiftUI

struct PasswordTFView: View {

    @Binding var password: String
    @State private var visible = false
    var body: some View {
        HStack {
            if !visible {
                SecureField("Password", text: $password)
                    .keyboardType(.numberPad)
                    .textContentType(.telephoneNumber)
                    .padding(.leading, 16)
            } else {
                TextField("Password", text: $password)
                    .keyboardType(.numberPad)
                    .textContentType(.telephoneNumber)
                    .padding(.leading, 16)
            }
            Button { visible.toggle() } label: {
                Image(systemName: visible ? "eye.slash" : "eye")
                    .opacity(password.isEmpty ? 0 : 1)
                    .disabled(password.isEmpty)
            }
        }
        .padding(.trailing, 16)
        .frame(width: 350, height: 45)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(!password.isEmpty
                        ? Color.accentColor
                        : Color.gray,lineWidth: 2)
        )
    }
}


struct PasswordTFView_Previews: PreviewProvider {
    static var previews: some View {
        LogScreenView(buttonAction: {})
    }
}
