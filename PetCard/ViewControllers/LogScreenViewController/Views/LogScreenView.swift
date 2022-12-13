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
        ScrollView {
            Image("Logo")
                .resizable()
                .frame(width: 100, height: 100)
                .padding(.top, 80)
            
            Text("Welcome")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.gray)
            
            LoginTFView(login: $login)
                .padding(.bottom, 8)
            
            PasswordTFView(password: $password)
            
            HStack {
                NavigationLink("Forgot your password?") {
                    ForgotPasswordView()
                }
                
                NavigationLink("Account registration") {
                    RegisterView()
                }
            }
            
            StandartBlueButton(
                title: "Log In",
                action: { buttonAction() }
            )
                
                Text("Application version - \(appVersion ?? "xxx")")
                    .font(.system(size: 13))
                    .foregroundColor(.gray)
                    .padding(.bottom, 0)
        }
        .padding()
    }
}

struct LogScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LogScreenView(buttonAction: {print("1")})
    }
}
