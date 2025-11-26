//
//  HomeView.swift
//  Kfe Los Balcones
//
//  Created by Ramiro Herdocia on 11/25/25.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var cart: CartManager
    
    let menuItems: [MenuItem] = Array(repeating:
        MenuItem(
            name: "GalloPinto Breakfast",
            description: "Traditional rice and beans with eggs, cheese, and plantain",
            price: 175
        ),
        count: 6
    )
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                
                // Non-button tags (WiFi, Parking, etc.)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        TagLabel(text: "Parking")
                        TagLabel(text: "WiFi")
                        TagLabel(text: "Rewards")
                        TagLabel(text: "Takeout")
                    }
                    .padding(.horizontal)
                }
                
                Text("Special Promotion: Whole Cakes on Sale!")
                    .font(.headline)
                    .padding(.horizontal)
                
                HStack(spacing: 12) {
                    CategoryPill(text: "All", isSelected: true)
                    CategoryPill(text: "Breakfast")
                    CategoryPill(text: "Coffees")
                    CategoryPill(text: "Frappes")
                }
                .padding(.horizontal)
                
                VStack(spacing: 12) {
                    ForEach(menuItems) { item in
                        MenuRow(item: item) {
                            cart.add(item: item)
                        }
                        .padding(.horizontal)
                    }
                }
                
                Spacer(minLength: 40)
            }
            .padding(.top)
        }
    }
}

// MARK: helper components

struct TagLabel: View {
    let text: String
    var body: some View {
        Text(text)
            .font(.caption)
            .padding(.vertical, 6)
            .padding(.horizontal, 10)
            .background(Color(.systemGray6))
            .cornerRadius(12)
    }
}

struct CategoryPill: View {
    let text: String
    var isSelected: Bool = false
    
    var body: some View {
        Text(text)
            .font(.subheadline)
            .padding(.vertical, 6)
            .padding(.horizontal, 14)
            .background(isSelected ? Color(.systemGray3) : Color(.systemGray6))
            .cornerRadius(14)
    }
}

struct MenuRow: View {
    let item: MenuItem
    let addAction: () -> Void
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(.systemGray5))
                .frame(width: 70, height: 70)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(item.name)
                    .font(.headline)
                Text(item.description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Text("C$\(Int(item.price))")
                    .font(.subheadline.bold())
            }
            Spacer()
            
            Button(action: addAction) {
                Text("+ Add")
                    .font(.subheadline.bold())
                    .padding(.vertical, 6)
                    .padding(.horizontal, 10)
                    .background(Color(.systemGray5))
                    .cornerRadius(12)
            }
        }
    }
}
