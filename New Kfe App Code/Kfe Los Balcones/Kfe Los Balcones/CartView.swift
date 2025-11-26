//
//  CartView.swift
//  Kfe Los Balcones
//
//  Created by Ramiro Herdocia on 11/25/25.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var cart: CartManager
    @EnvironmentObject var session: UserSession
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            if cart.items.isEmpty {
                Spacer()
                Text("Your cart is empty")
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .center)
                Spacer()
            } else {
                List {
                    ForEach(cart.items) { cartItem in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(cartItem.item.name)
                                    .font(.headline)
                                Text("C$\(Int(cartItem.item.price))")
                                    .font(.subheadline)
                            }
                            Spacer()
                            Stepper(value: binding(for: cartItem), in: 1...20) {
                                Text("\(quantity(for: cartItem))")
                            }
                        }
                    }
                }
                .listStyle(.plain)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("You’ll earn \(cart.pointsForCurrentOrder) royalty points with this order")
                        .font(.footnote)
                    
                    HStack {
                        Text("Subtotal")
                        Spacer()
                        Text("C$\(Int(cart.subtotal))")
                    }
                    HStack {
                        Text("IVA (15%)")
                        Spacer()
                        Text("C$\(Int(cart.iva))")
                    }
                    HStack {
                        Text("Total")
                            .font(.headline)
                        Spacer()
                        Text("C$\(Int(cart.total))")
                            .font(.headline)
                    }
                }
                .padding(.horizontal)
                
                Button {
                    // add points and clear cart
                    session.totalPoints += cart.pointsForCurrentOrder
                    cart.clear()
                } label: {
                    Text("Place Order")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(.systemRed))
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
                .padding()
            }
        }
        .navigationTitle("Your Cart")
    }
    
    // Helpers to mutate quantity inside List
    
    private func binding(for cartItem: CartItem) -> Binding<Int> {
        Binding(
            get: { quantity(for: cartItem) },
            set: { newValue in
                if let index = cart.items.firstIndex(where: { $0.id == cartItem.id }) {
                    cart.items[index].quantity = newValue
                }
            }
        )
    }
    
    private func quantity(for cartItem: CartItem) -> Int {
        cart.items.first(where: { $0.id == cartItem.id })?.quantity ?? cartItem.quantity
    }
}
