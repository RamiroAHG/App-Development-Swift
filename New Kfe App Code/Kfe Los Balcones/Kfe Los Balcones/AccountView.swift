//
//  AccountView.swift
//  Kfe Los Balcones
//
//  Created by Ramiro Herdocia on 11/25/25.
//

import SwiftUI

struct AccountView: View {
    @EnvironmentObject var session: UserSession
    @EnvironmentObject var cart: CartManager
    
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            
            // Header placeholder
            RoundedRectangle(cornerRadius: 0)
                .fill(Color(.systemGray4))
                .frame(height: 160)
                .overlay(
                    Text("Hotel Los Balcones")
                        .font(.headline)
                )
            
            Text("Account")
                .font(.largeTitle.bold())
                .padding(.horizontal)
            
            VStack(alignment: .leading, spacing: 8) {
                Text(session.name)
                    .font(.headline)
                Text(session.email)
                    .font(.subheadline)
                Text("ID: 1234567890")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(16)
            .padding(.horizontal)
            
            Spacer()
            
            Button {
                cart.clear()
                session.logout()
            } label: {
                HStack {
                    Image(systemName: "cup.and.saucer.fill")
                    Text("Log Out")
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color(.systemRed))
                .foregroundColor(.white)
                .cornerRadius(12)
            }
            .padding(.horizontal)
            
            Spacer()
            
            Text("Corner of the Banks, 1 block to the East\nOpen Daily: 8:00 AM - 9:00 PM\n+505 2341 3576")
                .font(.caption2)
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
                .frame(maxWidth: .infinity)
        }
        .navigationTitle("Account")
        .navigationBarTitleDisplayMode(.inline)
    }
}
