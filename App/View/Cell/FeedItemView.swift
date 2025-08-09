//
//  FeedItemView.swift
//  testdansmultipro
//
//  Created by PT Siaga Abdi Utama on 09/08/25.
//


import SwiftUI
import Domain

struct FeedItemView: View {
    let feed: Feed
    let onBookmark: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            // Image with rounded corners
            AsyncImage(url: URL(string: feed.imageUrl)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .frame(maxWidth: .infinity)
                        .frame(height: 180)
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(height: 180)
                        .clipped()
                case .failure:
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 100)
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity)
                        .frame(height: 180)
                        .background(Color(.systemGray6))
                @unknown default:
                    EmptyView()
                }
            }
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color(.systemGray4), lineWidth: 1)
            )
    
            
            HStack(spacing: 16) {
                Text(feed.title)
                    .font(.headline)
                    .lineLimit(2)
                    .foregroundColor(.primary)
                    .padding(.horizontal, 8)
                
                Spacer()
                
                Button(action: onBookmark) {
                    HStack(spacing: 4) {
                        Image(systemName: feed.isBookmarked ? "bookmark.fill" : "bookmark")
                        Text("Save")
                    }
                    .foregroundColor(feed.isBookmarked ? .blue : .gray)
                }
            }
            .font(.subheadline)
            .padding(.horizontal, 8)
            .padding(.bottom, 8)
        }
        .background(Color(.systemBackground))
        .cornerRadius(14)
        .shadow(color: Color.black.opacity(0.1), radius: 6, x: 0, y: 2)
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
    }
}
