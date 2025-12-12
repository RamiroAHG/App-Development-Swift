//
//  FIFAStaff2026App.swift
//  FIFAStaff2026
//
//  Created by Ramiro Herdocia on 12/4/25.
//

import SwiftUI

@main
struct FIFAStaff2026App: App {
    @StateObject private var appState = AppState()

    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environmentObject(appState)
        }
    }
}
