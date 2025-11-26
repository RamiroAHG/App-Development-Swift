//
//  ModelsAndManagers.swift
//  Kfe Los Balcones
//
//  Created by Ramiro Herdocia on 11/25/25.
//

import SwiftUI
internal import Combine

// MARK: - MODELS

struct MenuItem: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let description: String
    let price: Double
}

struct CartItem: Identifiable {
    let id = UUID()
    let item: MenuItem
    var quantity: Int
}

// MARK: - CART MANAGER

class CartManager: ObservableObject {
    @Published var items: [CartItem] = []
    
    func add(item: MenuItem) {
        if let index = items.firstIndex(where: { $0.item.id == item.id }) {
            items[index].quantity += 1
        } else {
            items.append(CartItem(item: item, quantity: 1))
        }
    }
    
    func clear() {
        items.removeAll()
    }
    
    var itemCount: Int {
        items.reduce(0) { $0 + $1.quantity }
    }
    
    var subtotal: Double {
        items.reduce(0) { $0 + Double($1.quantity) * $1.item.price }
    }
    
    var iva: Double {
        subtotal * 0.15   // 15% IVA
    }
    
    var total: Double {
        subtotal + iva
    }
    
    /// 1 point for every C$10 spent :contentReference[oaicite:0]{index=0}
    var pointsForCurrentOrder: Int {
        Int(subtotal / 10.0)
    }
}

// MARK: - USER SESSION

class UserSession: ObservableObject {
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var totalPoints: Int = 0
    
    var isLoggedIn: Bool {
        !name.isEmpty && !email.isEmpty
    }
    
    func login(name: String, email: String) {
        self.name = name
        self.email = email
    }
    
    func logout() {
        name = ""
        email = ""
        totalPoints = 0
    }
}
