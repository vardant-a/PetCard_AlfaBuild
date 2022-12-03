//
//  ForgotPasswordView.swift
//  PetCard
//
//  Created by Aleksei on 03.12.2022.
//

import SwiftUI

struct ForgotPasswordView: View {
    
    @Environment(\.presentationMode) var presentationMode:Binding<PresentationMode>
    
    @State private var stepOne = true
    @State private var createNewPass = false
    @State private var login = ""
    @State private var validCode = ""
    
    var body: some View {
        if stepOne {
            VStack(spacing: 12) {
                Text("Заглушка")
                TextField("Login", text: $login)
                    .textFieldStyle(.roundedBorder)
                StandartBlueButton(title: "Continue1") {
                    stepOne.toggle()
                }
                
                Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                }) {
                    Label("Black to Sign In", systemImage: "rectangle.leadinghalf.inset.filled.arrow.leading")
                }
            }
            .padding()
        } else {
            VStack {
                Text("Заглушка 2")
                TextField("ValidCode", text: $validCode)
                    .textFieldStyle(.roundedBorder)
                StandartBlueButton(title: "Continue2") {
                    createNewPass.toggle()
                }
                Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                }) {
                    Label("Black to Sign In", systemImage: "rectangle.leadinghalf.inset.filled.arrow.leading")
                }
            }
            .padding()
        }
    }
}

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView()
    }
}
