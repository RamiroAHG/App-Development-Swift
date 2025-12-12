//
//  SettingsView.swift
//  FIFAStaff2026
//
//  Created by Ramiro Herdocia on 12/4/25.
//

import SwiftUI

struct SettingsView: View {
    @State private var notificationsEnabled: Bool = true
    @State private var chatNotificationsEnabled: Bool = true
    @State private var emergencyNotificationsEnabled: Bool = true
    @State private var useDarkMode: Bool = false
    @State private var language: String = "English"
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Notifications") {
                    Toggle("Enable notifications", isOn: $notificationsEnabled)
                    Toggle("Chat alerts", isOn: $chatNotificationsEnabled)
                    Toggle("Emergency alerts", isOn: $emergencyNotificationsEnabled)
                }
                
                Section("Appearance") {
                    Toggle("Dark mode", isOn: $useDarkMode)
                    // In a real app, this would hook into system appearance
                }
                
                Section("Language") {
                    Picker("Language", selection: $language) {
                        Text("English").tag("English")
                        Text("Español").tag("Spanish")
                    }
                }
                
                Section("Account") {
                    Button("Log out") {
                        // In backend version, this would clear session
                    }
                    .foregroundStyle(.red)
                }
            }
            .navigationTitle("Settings")
        }
    }
}

