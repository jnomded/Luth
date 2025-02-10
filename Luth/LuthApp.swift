//
//  LuthApp.swift
//  Luth
//
//  Created by James Edmond on 2/8/25.
//

import SwiftUI

@main
struct LuthApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                HomeView()
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                PlayView()
                    .tabItem {
                        Label("Play", systemImage: "gamecontroller")
                    }
                SettingsView()
                    .tabItem {
                        Label("Settings", systemImage: "gear")
                    }
            }
        }
    }
}
