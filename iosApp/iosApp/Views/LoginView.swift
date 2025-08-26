//
//  LoginView.swift
//  iosApp
//
//  Created by Zach Lockett-Streiff on 8/26/25.
//
import SwiftUI
import Shared

struct LoginView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var signInSuccessful = true
    
    var body: some View {
        VStack {
            Text(Strings.jiveJournal)
            
            Text(Strings.signInToYourAccount)
            
            TextField(
                Strings.username,
                text: $username
            )
            .autocorrectionDisabled()
            .textFieldStyle(.roundedBorder)
            
            SecureField(
                Strings.password,
                text: $password
            )
            .autocorrectionDisabled()
            .textFieldStyle(.roundedBorder)
            
            Button(Strings.signIn) {
                signInSuccessful = true
            }
            .buttonStyle(.bordered)
        }
        .padding(.horizontal, 20)
    }
}
