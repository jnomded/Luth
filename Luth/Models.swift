//
//  Models.swift
//  Luth
//
//  Created by James Edmond on 2/9/25.
//
import Foundation

// previous game
struct Game: Identifiable {
    let id = UUID()
    let participants: [String]
    let scores: [String: Int]
    let outcome: String
}

// user
struct UserProfile {
    var username: String
    var isHost: Bool
}

enum GameType {
    case scrimmage
    case tournament
}

