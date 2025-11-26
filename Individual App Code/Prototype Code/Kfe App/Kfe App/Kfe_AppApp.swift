import SwiftUI

@main
struct KfeApp: App {
    @StateObject private var cart = CartViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(cart)
        }
    }
}

