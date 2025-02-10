//
//  RefereeScoringView.swift
//  Luth
//
//  Created by James Edmond on 2/9/25.
//


import SwiftUI


struct RefereeScoringView: View {
    let isHost: Bool
    @State private var teamAScore = 0
    @State private var teamBScore = 0
    @State private var showFinalConfirmation = false
    
    var body: some View {
        VStack(spacing: 30) {
            HStack(spacing: 40) {
                scoreSection(teamName: "Team A", score: $teamAScore)
                scoreSection(teamName: "Team B", score: $teamBScore)
            }
            
            if isHost {
                Button(action: { showFinalConfirmation = true }) {
                    Text("Confirm Final Scores")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding(.horizontal)
                .alert(isPresented: $showFinalConfirmation) {
                    Alert(title: Text("Final Scores Set"),
                          message: Text("Team A: \(teamAScore), Team B: \(teamBScore)"),
                          dismissButton: .default(Text("OK")))
                }
            } else {
                Text("Only the host can confirm final scores.")
                    .foregroundColor(.gray)
                    .padding()
            }
            
            Spacer()
        }
        .padding()
        .navigationTitle("Referee Mode")
        .onAppear {
            // Add sliding animation
        }
    }
    
    // helper view for teams score
    @ViewBuilder
    private func scoreSection(teamName: String, score: Binding<Int>) -> some View {
        VStack {
            Text(teamName)
                .font(.headline)
            Text("\(score.wrappedValue)")
                .font(.largeTitle)
            HStack {
                Button(action: { score.wrappedValue += 1 }) {
                    Text("+")
                        .font(.title)
                        .frame(width: 44, height: 44)
                        .background(Color.blue.opacity(0.7))
                        .foregroundColor(.white)
                        .clipShape(Circle())
                }
                Button(action: {
                    if score.wrappedValue > 0 {
                        score.wrappedValue -= 1
                    }
                }) {
                    Text("–")
                        .font(.title)
                        .frame(width: 44, height: 44)
                        .background(Color.red.opacity(0.7))
                        .foregroundColor(.white)
                        .clipShape(Circle())
                }
            }
        }
    }
}
