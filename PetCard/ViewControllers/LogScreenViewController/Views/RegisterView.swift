//
//  RegisterView.swift
//  PetCard
//
//  Created by Aleksei on 03.12.2022.
//

import SwiftUI

struct RegisterView: View {
    
    @State private var login = ""
    @State private var password = ""
    @State private var dublicatePass = ""
    
    @State private var passwordError = false
    @State private var showAlert = false
    
    var body: some View {
        VStack() {
            HStack {
                Text("Registration")
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                    .padding(.bottom)
                Spacer()
            }
            
            TextField("Login", text: $login)
                .textFieldStyle(.roundedBorder)
            
            HStack {
                TextField("Password", text: $password)
                    .textFieldStyle(.roundedBorder)
                
                Button(action: { showAlert.toggle() }) {
                    Image(systemName: "info.circle")
                }
                .alert("Passwords don`t match", isPresented: $showAlert) {
                    Button(role: .cancel, action: {
                        print("12124120415hfpasdasfas")
                    }) {
                        Text("Ok")
                    }
                }
            }
            
            TextField("Dublicate Password", text: $dublicatePass)
                .textFieldStyle(.roundedBorder)

            StandartBlueButton(title: "Sign Up") {
                createAccount()
            }
        }
        .padding()
    }
}

extension RegisterView {
    private func createAccount() {
        if password == dublicatePass {
            passwordError = false
            print("Register")
        } else {
            passwordError = true
            
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
