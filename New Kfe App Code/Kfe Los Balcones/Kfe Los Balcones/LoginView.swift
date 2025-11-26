//
//  LoginView.swift
//  Kfe Los Balcones
//
//  Created by Ramiro Herdocia on 11/25/25.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var session: UserSession
    
    @State private var name: String = ""
    @State private var email: String = ""
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 24) {
                Spacer()
                
                Text("WelcomeBack")
                    .font(.largeTitle.bold())
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Name")
                        .font(.subheadline)
                    TextField("Enter your name", text: $name)
                        .textFieldStyle(.roundedBorder)
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Email")
                        .font(.subheadline)
                    TextField("Enter your email", text: $email)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)
                }
                
                Button {
                    session.login(name: name, email: email)
                } label: {
                    HStack {
                        Image(systemName: "cup.and.saucer.fill")
                        Text("Sign in")
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(.black)
                    .foregroundColor(.white)
                    .cornerRadius(12)
                }
                .disabled(name.isEmpty || email.isEmpty)
                
                Spacer()
                
                Text("New to Kfe Los Balcones\nJust enter your Name and Email")
                    .font(.footnote)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                
                Text("Corner of the Banks, 1 block to the East\nOpen Daily: 8:00 AM - 9:00 PM\n+505 2341 3576")
                    .font(.caption2)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
            }
            .padding()
        }
    }
}

