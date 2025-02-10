//
//  ContentView.swift
//  Luth
//
//  Created by James Edmond on 2/8/25.
//
import SwiftUI

struct ContentView: View {
    @StateObject var sessionManager = GameSessionManager()
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem { Label("Home", systemImage: "house") }
            
            PlayView()
                .tabItem { Label("Play", systemImage: "gamecontroller") }
            
            SettingsView()
                .tabItem { Label("Settings", systemImage: "gear") }
        }
        .environmentObject(sessionManager)
    }
}

#Preview {
    ContentView()
}
