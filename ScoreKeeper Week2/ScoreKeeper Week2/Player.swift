//
//  Player.swift
//  ScoreKeeper Week2
//
//  Created by Ramiro Herdocia on 11/7/25.
//

import Foundation

struct Player: Identifiable{
    let id = UUID()
    var name: String
    var score: Int
}

extension Player: Equatable {
    static func == (lhs: Player, rhs: Player) -> Bool {
        lhs.name == rhs.name && lhs.score == rhs.score
    }
}
