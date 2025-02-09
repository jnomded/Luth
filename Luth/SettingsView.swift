//
//  SettingsView.swift
//  Luth
//
//  Created by James Edmond on 2/8/25.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationStack {
            Form {
                Section("Account") {
                    Text("Profile Settings")
                    Text("Units Preferences")
                    Text("Workout History")
                }
                
                Section("About") {
                    Text("Help Center")
                    Text("Contact Support")
                }
            }
            .navigationTitle("Settings")
        }
    }
}
