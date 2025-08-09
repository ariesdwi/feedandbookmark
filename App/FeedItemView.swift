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
        VStack(alignment: .leading) {
            // Image
            AsyncImage(url: URL(string: feed.imageUrl)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .frame(height: 200)
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                case .failure:
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                @unknown default:
                    EmptyView()
                }
            }
            
            // Title
            Text(feed.title)
                .font(.headline)
                .padding(.top, 8)
            
            // Like and Bookmark buttons
            HStack {
                Button {
                    // Handle like action
                } label: {
                    Image(systemName: feed.isLiked ? "heart.fill" : "heart")
                        .foregroundColor(feed.isLiked ? .red : .gray)
                }
                
                Spacer()
                
                Button {
                    onBookmark()
                } label: {
                    Image(systemName: feed.isBookmarked ? "bookmark.fill" : "bookmark")
                        .foregroundColor(feed.isBookmarked ? .blue : .gray)
                }
            }
            .padding(.top, 8)
        }
        .padding()
    }
}
