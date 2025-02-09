//
//  ContentView.swift
//  Luth
//
//  Created by James Edmond on 2/8/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeFeedView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            
            RecordWorkoutView()
                .tabItem {
                    Image(systemName: "plus.circle")
                    Text("Record")
                }
            
            SettingsView()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }
        }
    }
}


#Preview {
    HomeFeedView()
        .preferredColorScheme(.dark)
}
