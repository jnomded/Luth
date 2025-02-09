//
//  WorkoutPost.swift
//  Luth
//
//  Created by James Edmond on 2/8/25.
//

import SwiftUI

struct DetailPill: View {
    let icon: String
    let text: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
            Text(text)
        }
        .padding(8)
        .background(Color(.secondarySystemBackground))
        .cornerRadius(8)
    }
}

struct WorkoutPostView: View {
    let post: WorkoutPost
    @State private var isLiked = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            // user Header
            HStack {
                Image(systemName: post.user.profileImage)
                    .resizable()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                
                VStack(alignment: .leading) {
                    Text(post.user.username)
                        .font(.headline)
                    Text(post.date.formatted(date: .abbreviated, time: .shortened))
                        .foregroundStyle(.secondary)
                        .font(.caption)
                }
                
                Spacer()
            }
            
            // Workouts details
            VStack(alignment: .leading, spacing: 8) {
                Text(post.exerciseName)
                    .font(.title2.weight(.bold))
                
                HStack {
                    DetailPill(icon: "scalemass", text: "\(post.weight.formatted()) lbs")
                    DetailPill(icon: "repeat", text: "\(post.reps) reps")
                }
            }
            
            // interactions smah that like button
            HStack(spacing: 20) {
                Button {
                    isLiked.toggle()
                } label: {
                    Label(isLiked ? "\(post.likes + 1)" : "\(post.likes)",
                          systemImage: isLiked ? "heart.fill" : "heart")
                        .foregroundStyle(isLiked ? .red : .primary)
                }
                .scaleEffect(isLiked ? 1.1 : 1)
                .animation(.spring(), value: isLiked)
                
                Button {
                    // comment
                } label: {
                    Label("\(post.comments.count)", systemImage: "bubble.right")
                }
                
                Spacer()
                
                Button {
                    // share
                } label: {
                    Label("Share", systemImage: "square.and.arrow.up")
                }
            }
            .buttonStyle(.plain)
            .foregroundStyle(.secondary)
        }
    }
}

