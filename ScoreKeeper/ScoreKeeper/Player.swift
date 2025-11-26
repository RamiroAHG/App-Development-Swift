//
//  File.swift
//  ScoreKeeper
//
//  Created by Ramiro Herdocia on 10/3/25.
//

import Foundation
struct Player: Identifiable {
    let id = UUID()
    var name: String
    var score: Int
}
