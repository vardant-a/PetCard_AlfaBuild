//
//  LogScreenView.swift
//  PetCard
//
//  Created by Aleksei on 30.11.2022.
//

import SwiftUI

struct LogScreenView: View {
    
    @State private var showSignUp = false
    @State private var loggedIn = false
    
    @State private var login = ""
    @State private var password = ""
    
    var buttonAction: () -> Void
    
    // Determining the Application Version
    private let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            Image("Logo")
                .resizable()
                .frame(width: 150, height: 150)
            
            Text("Log In to your account")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.gray)
            
            LoginTFView(login: $login)
                .padding(.bottom, 8)
            
            PasswordTFView(password: $password)
            
            HStack {
                Button("Forgot your password?") {
                    // action
                }
        
                Button("Account registration") {
                    // action
                }
            }
            
            StandartBlueButton(
                title: "Log In",
                action: { buttonAction() })
            Spacer()
            
            Text("Application version - \(appVersion ?? "xxx")")
                .font(.system(size: 13))
                .foregroundColor(.gray)
                .padding(.bottom, 5)
        }

        .padding()
    }
}

struct LogScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LogScreenView(buttonAction: {print("1")})
    }
}
