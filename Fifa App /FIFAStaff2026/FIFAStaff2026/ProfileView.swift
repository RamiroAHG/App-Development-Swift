//
//  ProfileView.swift
//  FIFAStaff2026
//
//  Created by Ramiro Herdocia on 12/4/25.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        let user = appState.currentUser
        
        NavigationStack {
            Form {
                Section("Name") {
                    Text(user.name)
                }
                Section("Role") {
                    Text(user.role.rawValue)
                }
                Section("Stadium / Gate / Zone") {
                    Text(user.stadium)
                    Text("Gate: \(user.gate)")
                    Text("Zone: \(user.zone)")
                }
                Section("Contact") {
                    Text(user.phone)
                }
                
                Section {
                    Text("Profile is managed by your supervisor.")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }
            }
            .navigationTitle("Profile")
        }
    }
}

