//
//  LogScreenView.swift
//  PetCard
//
//  Created by Aleksei on 30.11.2022.
//

import SwiftUI

struct LogScreenView: View {
    @State private var login = ""
    @State private var password = ""
    @State private var valid = false
    var buttonAction: () -> Void
    var body: some View {
            VStack {
                Image("Logo")
                    .resizable()
                    .frame(maxWidth: 200, maxHeight: 200)
                    .padding(.top, 60)
                    .padding(.bottom, 60)
                
                LoginTFView(login: $login, action: { print("log") })
                    .padding(.bottom, 8)
                PasswordTFView(password: $password)
                    .padding(.bottom, 8)
                Button(action: { buttonAction() }) {
                    Text("Log In")
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, maxHeight: 44)
                        .background(.blue)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
                .sheet(isPresented: $valid, content: {
                    // TabBarController
                })
                HStack {
                    Rectangle().frame(height: 2)
                    Text("OR")
                        .fontWeight(.bold)
                    Rectangle().frame(height: 2)
                }
                GoogleAutButton()
                Spacer()
            }
            .padding()
    }
    
    @ViewBuilder
    private func GoogleAutButton() -> some View {
        Button(action: {}) {
            Text("With to Google")
        }
    }
}

struct LogScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LogScreenView(buttonAction: {print("1")})
    }
}
