//
//  ContentView.swift
//  Test #1
//
//  Created by Ramiro Herdocia on 10/15/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            ZStack {
                  Circle()
                  .foregroundStyle(.red)
                   Rectangle()
                  .foregroundStyle(.yellow)
                  .frame(width: 60, height: 60)
                 }
             Circle()
             .foregroundStyle(.green)
        }
    }
}

#Preview {
    ContentView()
}
