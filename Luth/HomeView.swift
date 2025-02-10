//
//  HomeView.swift
//  Luth
//
//  Created by James Edmond on 2/9/25.
//
import SwiftUI

// game card recap view
struct GameCardView: View {
    let game: Game
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("Participants: \(game.participants.joined(separator: ", "))")
                .font(.headline)
            Text("Scores:")
            ForEach(game.scores.keys.sorted(), id: \.self) { key in
                Text("\(key): \(game.scores[key]!)")
            }
            Text("Outcome: \(game.outcome)")
                .font(.subheadline)
                .padding(.top, 4)
        }
        .padding()
        .background(Color(.secondarySystemBackground))
        .cornerRadius(10)
        .shadow(radius: 2)
    }
}

//social media view
struct HomeView: View {
    @State private var games: [Game] = [
        Game(participants: ["Alice", "Bob"], scores: ["Alice": 3, "Bob": 2], outcome: "Alice wins"),
        Game(participants: ["Charlie", "Dana"], scores: ["Charlie": 1, "Dana": 4], outcome: "Dana wins")
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 16) {
                    ForEach(games) { game in
                        GameCardView(game: game)
                            .padding(.horizontal)
                    }
                }
                .padding(.vertical)
            }
            .navigationTitle("Game Recaps")
        }
    }
}

