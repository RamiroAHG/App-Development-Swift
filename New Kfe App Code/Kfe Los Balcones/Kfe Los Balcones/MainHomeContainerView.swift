//
//  MainHomeContainerView.swift
//  Kfe Los Balcones
//
//  Created by Ramiro Herdocia on 11/25/25.
//

import SwiftUI

struct MainHomeContainerView: View {
    @EnvironmentObject var cart: CartManager
    @EnvironmentObject var session: UserSession
    
    var body: some View {
        NavigationStack {
            HomeView()
                .navigationTitle("Kfé Los Balcones")
                .toolbar {
                    
                    // Cart icon (top-right)
                    ToolbarItem(placement: .topBarTrailing) {
                        NavigationLink {
                            CartView()
                        } label: {
                            CartButton(cart: cart)
                        }
                    }
                    
                    // Profile icon (top-left)
                    ToolbarItem(placement: .topBarLeading) {
                        NavigationLink {
                            AccountView()
                        } label: {
                            Image(systemName: "person.circle.fill")
                                .font(.title2)
                        }
                    }
                }
        }
    }
}

