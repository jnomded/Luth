//
//  HomeFeedView.swift
//  Luth
//
//  Created by James Edmond on 2/8/25.
//

import SwiftUI

struct HomeFeedView: View {
    @State private var posts = WorkoutPost.samplePosts
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 20) {
                    ForEach(posts) { post in
                        WorkoutPostView(post: post)
                            .padding()
                            .background(Color(.systemBackground))
                            .cornerRadius(15)
                            .shadow(color: Color.black.opacity(0.1), radius: 5, y: 2)
                    }
                }
                .padding(.horizontal)
            }
            .navigationTitle("LiftFeed")
            .refreshable {} //refresh later
        }
    }
}


extension WorkoutPost {
    static let sampleUser = User(
        username: "liftmaster3000",
        profileImage: "person.crop.circle.fill",
        followingCount: 342,
        followerCount: 891
    )
    
    static let samplePosts = [
        WorkoutPost(
            user: sampleUser,
            exerciseName: "Deadlift",
            weight: 405,
            reps: 3,
            date: Date().addingTimeInterval(-3600),
            likes: 24,
            comments: [
                Comment(
                    user: sampleUser,
                    text: "New PR!",
                    timestamp: Date().addingTimeInterval(-3500)
                )
            ]
        )
    ]
}
