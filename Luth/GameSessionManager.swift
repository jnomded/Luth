//
//  GameSessionManager.swift
//  Luth
//
//  Created by James Edmond on 2/9/25.
//
import Foundation
import Combine


class GameSessionManager: ObservableObject {
    //current game
    @Published var currentGame: Game? = nil
    
    //current players
    @Published var players: [String] = []
    
    //new game
    init() {
        //can set values here
    }
    
    // starts a new game session with the players in the []
    func startSession(with players: [String]) {
        self.players = players
        //  example, create a new game record
        currentGame = Game(participants: players, scores: [:], outcome: "In Progress")
    }
    
    //ends and saves
    func endSession(finalScores: [String: Int], outcome: String) {
        guard var game = currentGame else { return }
        game = Game(participants: game.participants, scores: finalScores, outcome: outcome)
        // Save
        currentGame = nil
        // Optionally reset players
        players = []
    }
}
