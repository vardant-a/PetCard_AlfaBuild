//
//  LogScreenView.swift
//  PetCard
//
//  Created by Aleksei on 30.11.2022.
//

import SwiftUI

enum Status {
    case active
    case desable
}

struct LogScreenView: View {
    
    @State private var showSignUp = false
    @State private var loggedIn = false
    
    @State private var login = ""
    @State private var password = ""
    
    var buttonAction: () -> Void
    
    // Determining the Application Version
    private let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
    var body: some View {
        VStack {
            Spacer()
            Image("Logo")
                .resizable()
                .frame(width: 150, height: 150)
            
            Text("Log In to your account")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.gray)
            
            CustomTextField(function: "Phone number")
            
            CustomTextField(function: "Password")
            
            Button {} label: {
                Text("Forgot your password?")
            }
            RouteButton(
                title: "Log In",
                action: { buttonAction() })
            Spacer()
            
            Text("Application version - \(appVersion ?? "xxx")")
                .font(.system(size: 13))
                .foregroundColor(.gray)
                .padding(.bottom, 5)
        }

    }
}

struct LogScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LogScreenView(buttonAction: {print("1")})
    }
}


struct RouteButton: View {
    var title: String
    var action: ()-> Void
    
    var body: some View {
        Button(action: action, label: {
            Text(title)
            .frame(width: 350, height: 45)
            .tint(.white)
            })
        .background(Color.accentColor)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

struct CustomTextField: View {
    
    let function: String

    @State private var phone = ""
    @State private var password = ""
    @State private var visible = false
    
    var body: some View {
        if function != "Password" {
            TextField(function, text: $phone)
                .keyboardType(.numberPad)
                .textContentType(.telephoneNumber)
                .padding(.leading, 16)
                .frame(width: 350, height: 45)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(phone != ""
                                ? Color.accentColor
                                : Color.gray,lineWidth: 2)
                )
        } else {
            HStack {
                if !visible {
                    SecureField(function, text: $password)
                        .padding(.leading, 16)
                } else {
                    TextField(function, text: $password)
                        .padding(.leading, 16)
                }
                Button { visible.toggle() } label: {
                    Image(systemName: visible ? "eye.slash" : "eye")
                }
            }
            .padding(.trailing, 16)
            .frame(width: 350, height: 45)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(password != ""
                            ? Color.accentColor
                            : Color.gray,lineWidth: 2)
            )
        }
    }
}

//            VStack {
//                Image("Logo")
//                    .resizable()
//                    .frame(maxWidth: 200, maxHeight: 200)
//                    .padding(.top, 60)
//                    .padding(.bottom, 60)
//
//                LoginTFView(login: $login, action: { print("log") })
//                    .padding(.bottom, 8)
//                PasswordTFView(password: $password)
//                    .padding(.bottom, 8)
//                Button(action: { buttonAction() }) {
//                    Text("Log In")
//                        .fontWeight(.bold)
//                        .frame(maxWidth: .infinity, maxHeight: 44)
//                        .background(.blue)
//                        .foregroundColor(.white)
//                        .cornerRadius(12)
//                }
//                .sheet(isPresented: $valid, content: {
//                    // TabBarController
//                })
//                HStack {
//                    Rectangle().frame(height: 2)
//                    Text("OR")
//                        .fontWeight(.bold)
//                    Rectangle().frame(height: 2)
//                }
//                GoogleAutButton()
//                Spacer()
//            }
//            .padding()
