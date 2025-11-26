//
//  RootView.swift
//  Kfe Los Balcones
//
//  Created by Ramiro Herdocia on 11/25/25.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject var session: UserSession
    
    var body: some View {
        if session.isLoggedIn {
            MainHomeContainerView()
        } else {
            LoginView()
        }
    }
}
