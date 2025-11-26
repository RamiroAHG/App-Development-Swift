//
//  Kfe_Los_BalconesApp.swift
//  Kfe Los Balcones
//
//  Created by Ramiro Herdocia on 11/25/25.
//

import SwiftUI

@main
struct KfeLosBalconesApp: App {
    @StateObject private var cart = CartManager()
    @StateObject private var session = UserSession()
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(cart)
                .environmentObject(session)
        }
    }
}
