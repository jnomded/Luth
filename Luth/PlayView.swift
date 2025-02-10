//
//  PlayView.swift
//  Luth
//
//  Created by James Edmond on 2/9/25.
//


import SwiftUI

// choose play type
struct PlayView: View {
    @State private var selectedGameType: GameType = .scrimmage
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Choose Game Mode")
                    .font(.largeTitle)
                
                Picker("Game Type", selection: $selectedGameType) {
                    Text("Scrimmage").tag(GameType.scrimmage)
                    Text("Tournament").tag(GameType.tournament)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                NavigationLink(destination: GameSetupView(gameType: selectedGameType)) {
                    Text("Host Game")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        .padding(.horizontal)
                }
                
                Spacer()
            }
            .navigationTitle("Play")
        }
    }
}

//options
struct GameSetupView: View {
    let gameType: GameType
    @State private var selectedSport = "Soccer"
    @State private var selectedGameMode = "Standard"
    private let sportOptions = ["Soccer", "Basketball", "Tennis"]
    private let gameModes = ["Standard", "Speed", "Elimination"]
    
    var body: some View {
        Form {
            Section(header: Text("Sport Type")) {
                Picker("Select Sport", selection: $selectedSport) {
                    ForEach(sportOptions, id: \.self) { sport in
                        Text(sport)
                    }
                }
            }
            
            Section(header: Text("Game Mode")) {
                Picker("Select Mode", selection: $selectedGameMode) {
                    ForEach(gameModes, id: \.self) { mode in
                        Text(mode)
                    }
                }
            }
            
            Section {
                NavigationLink(destination: GameLogicView(gameType: gameType,
                                                          sport: selectedSport,
                                                          mode: selectedGameMode)) {
                    Text("Start \(gameType == .scrimmage ? "Scrimmage" : "Tournament")")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
        }
        .navigationTitle("Game Setup")
    }
}

//game theory!! nah game logic
struct GameLogicView: View {
    let gameType: GameType
    let sport: String
    let mode: String
    
    // example list of players would be real people
    @State private var players = ["Alice", "Bob", "Charlie", "Dana"]
    
    var body: some View {
        VStack {
            if gameType == .scrimmage {
                Text("Scrimmage Setup for \(sport) in \(mode) mode")
                    .font(.headline)
                    .padding()
                List {
                    ForEach(scrimmagePairs(), id: \.self) { pair in
                        Text(pair.joined(separator: " vs "))
                    }
                }
            } else if gameType == .tournament {
                Text("Tournament Bracket for \(sport) in \(mode) mode")
                    .font(.headline)
                    .padding()
                TournamentBracketView(players: players)
            }
            
            Spacer()
            
            // referee mode
            NavigationLink(destination: RefereeScoringView(isHost: true)) {
                Text("Enter Referee Mode")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.orange)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                    .padding(.horizontal)
            }
            .padding(.bottom)
        }
        .navigationTitle(gameType == .scrimmage ? "Scrimmage" : "Tournament")
    }
    
    //scrimmage pairing
    func scrimmagePairs() -> [[String]] {
        var pairs: [[String]] = []
        let shuffled = players.shuffled()
        for i in stride(from: 0, to: shuffled.count, by: 2) {
            if i+1 < shuffled.count {
                pairs.append([shuffled[i], shuffled[i+1]])
            } else {
                pairs.append([shuffled[i]])
            }
        }
        return pairs
    }
}

// tournament mode mathcing
struct TournamentBracketView: View {
    let players: [String]
    
    var body: some View {
        List {
            ForEach(firstRoundMatchups(), id: \.self) { matchup in
                Text(matchup.joined(separator: " vs "))
            }
        }
    }
    
    func firstRoundMatchups() -> [[String]] {
        var matchups: [[String]] = []
        let shuffled = players.shuffled()
        for i in stride(from: 0, to: shuffled.count, by: 2) {
            if i+1 < shuffled.count {
                matchups.append([shuffled[i], shuffled[i+1]])
            } else {
                matchups.append([shuffled[i]])
            }
        }
        return matchups
    }
}
