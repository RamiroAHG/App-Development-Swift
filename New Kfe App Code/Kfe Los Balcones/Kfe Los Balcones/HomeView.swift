//
//  HomeView.swift
//  Kfe Los Balcones
//
//  Created by Ramiro Herdocia on 11/25/25.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var cart: CartManager
    
    let menuItems: [MenuItem] = [
        

            // MARK: - Breakfast (4)
            MenuItem(
                name: "GalloPinto Breakfast",
                description: "Traditional rice and beans with eggs, cheese, and sweet plantain",
                price: 175,
                imageName: "gallopinto"
            ),
            MenuItem(
                name: "Pancake Stack",
                description: "Fluffy pancakes served with butter and syrup",
                price: 150,
                imageName: "pancakes"
            ),
            MenuItem(
                name: "Breakfast Burrito",
                description: "Eggs, cheese, chorizo, and veggies wrapped in a warm tortilla",
                price: 180,
                imageName: "burrito"
            ),
            MenuItem(
                name: "Omelette Deluxe",
                description: "Three-egg omelette with peppers, ham, onions, and cheese",
                price: 165,
                imageName: "omelette"
            ),

            // MARK: - Appetizers (4)
            MenuItem(
                name: "Cheese Quesadilla",
                description: "Grilled tortilla filled with melted cheese",
                price: 120,
                imageName: "quesadilla"
            ),
            MenuItem(
                name: "Chicken Tenders",
                description: "Crispy breaded chicken strips served with dipping sauce",
                price: 160,
                imageName: "tenders"
            ),
            MenuItem(
                name: "Loaded Nachos",
                description: "Tortilla chips topped with cheese, beans, and jalapeños",
                price: 185,
                imageName: "nachos"
            ),
            MenuItem(
                name: "Mozzarella Sticks",
                description: "Crispy fried mozzarella with marinara sauce",
                price: 150,
                imageName: "sticks"
            ),

            // MARK: - Lunch Options (6)
            MenuItem(
                name: "Chicken Alfredo",
                description: "Creamy pasta with grilled chicken and parmesan",
                price: 220,
                imageName: "alfredo"
            ),
            MenuItem(
                name: "Grilled Chicken Bowl",
                description: "Chicken, rice, veggies, avocado, and house sauce",
                price: 210,
                imageName: "chickenbowl"
            ),
            MenuItem(
                name: "Beef Burger",
                description: "Juicy beef patty with cheese, lettuce, and tomato",
                price: 190,
                imageName: "burger"
            ),
            MenuItem(
                name: "Chicken Wrap",
                description: "Grilled chicken, lettuce, tomato, and sauce in tortilla",
                price: 160,
                imageName: "wrap"
            ),
            MenuItem(
                name: "Spaghetti Bolognese",
                description: "Classic pasta with slow-cooked meat sauce",
                price: 200,
                imageName: "bolognese"
            ),
            MenuItem(
                name: "Veggie Rice Bowl",
                description: "Rice with vegetables, beans, avocado, and spices",
                price: 170,
                imageName: "veggiebowl"
            ),

            // MARK: - Sandwiches (4)
            MenuItem(
                name: "Ham & Cheese Sandwich",
                description: "Warm sandwich with ham, cheese, and butter",
                price: 160,
                imageName: "sandwich"
            ),
            MenuItem(
                name: "Turkey Club",
                description: "Turkey, bacon, lettuce, tomato, and mayo",
                price: 175,
                imageName: "club"
            ),
            MenuItem(
                name: "Chicken Parmesan Sandwich",
                description: "Breaded chicken with marinara and mozzarella",
                price: 190,
                imageName: "chickenparm"
            ),
            MenuItem(
                name: "Tuna Melt",
                description: "Tuna salad with melted cheese on toasted bread",
                price: 165,
                imageName: "tuna"
            ),

            // MARK: - Coffees & Frappes (10)
            MenuItem(
                name: "Iced Latte",
                description: "Smooth espresso over ice with milk",
                price: 120,
                imageName: "latte"
            ),
            MenuItem(
                name: "Cappuccino",
                description: "Espresso with steamed milk and foam",
                price: 110,
                imageName: "cappuccino"
            ),
            MenuItem(
                name: "Mocha Frappe",
                description: "Blended iced coffee with chocolate",
                price: 140,
                imageName: "frappe"
            ),
            MenuItem(
                name: "Caramel Frappe",
                description: "Iced frappe with caramel drizzle",
                price: 140,
                imageName: "caramelfrappe"
            ),
            MenuItem(
                name: "Black Coffee",
                description: "Fresh hot brewed coffee",
                price: 75,
                imageName: "black"
            ),
            MenuItem(
                name: "Espresso Shot",
                description: "Strong and bold espresso",
                price: 60,
                imageName: "espresso"
            ),
            MenuItem(
                name: "Vanilla Latte",
                description: "Espresso with milk and vanilla flavor",
                price: 130,
                imageName: "vanillalatte"
            ),
            MenuItem(
                name: "Hazelnut Frappe",
                description: "Frappe blended with hazelnut syrup",
                price: 145,
                imageName: "hazelnut"
            ),
            MenuItem(
                name: "Iced Americano",
                description: "Espresso poured over ice and water",
                price: 95,
                imageName: "americano"
            ),
            MenuItem(
                name: "Hot Chocolate",
                description: "Creamy cocoa drink",
                price: 115,
                imageName: "hotchocolate"
            ),

            // MARK: - Sides (4)
            MenuItem(
                name: "French Fries",
                description: "Crispy golden fries",
                price: 95,
                imageName: "fries"
            ),
            MenuItem(
                name: "Side Salad",
                description: "Fresh greens with house dressing",
                price: 80,
                imageName: "salad"
            ),
            MenuItem(
                name: "Garlic Bread",
                description: "Buttery garlic toasted bread",
                price: 70,
                imageName: "garlicbread"
            ),
            MenuItem(
                name: "Sweet Plantains",
                description: "Fried sweet plantains",
                price: 85,
                imageName: "plantains"
            ),

            // MARK: - Sweets (10)
            MenuItem(
                name: "Chocolate Chip Cookie",
                description: "Fresh baked cookie with chocolate chips",
                price: 60,
                imageName: "cookie"
            ),
            MenuItem(
                name: "Oatmeal Raisin Cookie",
                description: "Soft cookie with oats and raisins",
                price: 60,
                imageName: "oatmeal"
            ),
            MenuItem(
                name: "Brownie",
                description: "Rich chocolate brownie",
                price: 70,
                imageName: "brownie"
            ),
            MenuItem(
                name: "Banana Bread",
                description: "Moist homemade banana bread",
                price: 75,
                imageName: "bananabread"
            ),
            MenuItem(
                name: "Blueberry Muffin",
                description: "Fluffy muffin with blueberries",
                price: 70,
                imageName: "muffin"
            ),
            MenuItem(
                name: "Cinnamon Roll",
                description: "Swirled pastry with icing",
                price: 90,
                imageName: "cinnamon"
            ),
            MenuItem(
                name: "Cheesecake Slice",
                description: "Creamy NY-style cheesecake",
                price: 110,
                imageName: "cheesecake"
            ),
            MenuItem(
                name: "Cupcake",
                description: "Vanilla cupcake with frosting",
                price: 65,
                imageName: "cupcake"
            ),
            MenuItem(
                name: "Chocolate Donut",
                description: "Glazed chocolate donut",
                price: 55,
                imageName: "donut"
            ),
            MenuItem(
                name: "Apple Pie",
                description: "Warm pie with cinnamon apples",
                price: 120,
                imageName: "applepie"
            ),

            // MARK: - Beverages (15)
            // Sodas (5)
            MenuItem(name: "Coca-Cola", description: "Chilled Coca-Cola bottle", price: 55, imageName: "coke"),
            MenuItem(name: "Sprite", description: "Lemon-lime soda", price: 55, imageName: "sprite"),
            MenuItem(name: "Fanta Orange", description: "Orange flavored soda", price: 55, imageName: "fanta"),
            MenuItem(name: "Root Beer", description: "Creamy, sweet soda", price: 60, imageName: "rootbeer"),
            MenuItem(name: "Ginger Ale", description: "Refreshing ginger soda", price: 60, imageName: "gingerale"),

            // Waters (3)
            MenuItem(name: "Bottled Water", description: "Purified drinking water", price: 25, imageName: "water"),
            MenuItem(name: "Sparkling Water", description: "Carbonated mineral water", price: 40, imageName: "sparkling"),
            MenuItem(name: "Coconut Water", description: "Natural coconut hydration", price: 70, imageName: "coconut"),

            // Fruit Smoothies (4)
            MenuItem(name: "Strawberry Smoothie", description: "Blended fresh strawberries", price: 130, imageName: "strawberry"),
            MenuItem(name: "Mango Smoothie", description: "Creamy mango blend", price: 130, imageName: "mango"),
            MenuItem(name: "Pineapple Smoothie", description: "Pineapple fruit smoothie", price: 130, imageName: "pineapple"),
            MenuItem(name: "Berry Blast Smoothie", description: "Mixed berry frozen smoothie", price: 140, imageName: "berry"),

            // House Specials (3)
            MenuItem(name: "Mint Lemonade", description: "Fresh lemonade with mint", price: 95, imageName: "mint"),
            MenuItem(name: "Passion Fruit Drink", description: "Sweet and tart passion fruit blend", price: 105, imageName: "passion"),
            MenuItem(name: "Horchata", description: "Sweet rice milk drink with cinnamon", price: 90, imageName: "horchata")
        ]
    
    
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
                
                // ⛔️ Categories removed here
                
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

struct MenuRow: View {
    let item: MenuItem
    let addAction: () -> Void
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            
            Image(item.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 70, height: 70)
                .clipped()
                .cornerRadius(10)
            
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
