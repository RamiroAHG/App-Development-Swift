//
//  CartButton.swift
//  Kfe Los Balcones
//
//  Created by Ramiro Herdocia on 11/25/25.
//

import SwiftUI

struct CartButton: View {
    @ObservedObject var cart: CartManager
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Image(systemName: "cart")
                .font(.title2)
            
            if cart.itemCount > 0 {
                Text("\(cart.itemCount)")
                    .font(.caption2)
                    .padding(5)
                    .background(Circle().fill(Color.red))
                    .foregroundColor(.white)
                    .offset(x: 8, y: -8)
            }
        }
    }
}
