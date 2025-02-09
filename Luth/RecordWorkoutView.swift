//
//  RecordWorkoutView.swift
//  Luth
//
//  Created by James Edmond on 2/8/25.
//

import SwiftUI

struct RecordWorkoutView: View {
    @State private var exerciseName = ""
    @State private var weight = 135.0
    @State private var reps = 5
    @State private var date = Date()
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Exercise Details") {
                    TextField("Exercise Name", text: $exerciseName)
                    Stepper("Weight: \(weight.formatted()) lbs", value: $weight, in: 0...1000, step: 5)
                    Stepper("Reps: \(reps)", value: $reps, in: 1...50)
                    DatePicker("Date", selection: $date)
                }
                
                Section {
                    Button("Save Workout") {
                        // Save logic 
                    }
                }
            }
            .navigationTitle("New Workout")
        }
    }
}
