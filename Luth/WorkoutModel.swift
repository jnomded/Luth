//
//  WorkoutModel.swift
//  Luth
//
//  Created by James Edmond on 2/8/25.
//
import SwiftUI

struct Workout: Identifiable {
    let id = UUID()
    let exerciseName: String
    let weight: Double
    let reps: Int
    let date: Date
}

struct User: Identifiable {
    let id = UUID()
    let username: String
    let profileImage: String //image url or system image i have no idea
    let followingCount: Int
    let followerCount: Int
}

struct WorkoutPost: Identifiable {
    let id = UUID()
    let user: User
    let exerciseName: String
    let weight: Double
    let reps: Int
    let date: Date
    var likes: Int
    var comments: [Comment]
}

struct Comment: Identifiable {
    let id = UUID()
    let user: User
    let text: String
    let timestamp: Date
}


