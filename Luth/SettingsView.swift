//
//  SettingsView.swift
//  Luth
//
//  Created by James Edmond on 2/9/25.
//


import SwiftUI

//manage user and connection
struct SettingsView: View {
    @State private var username: String = "Player"
    @StateObject private var connectivityManager = ConnectivityManager()
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("User Profile")) {
                    TextField("Username", text: $username)
                        .autocapitalization(.none)
                }
                
                Section(header: Text("Connectivity")) {
                    Text("Peer: \(connectivityManager.peerID.displayName)")
                    // Additional settings for here
                }
            }
            .navigationTitle("Settings")
        }
    }
}
