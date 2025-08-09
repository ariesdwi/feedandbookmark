//
//  BookmarkedFeedsView.swift
//  testdansmultipro
//
//  Created by PT Siaga Abdi Utama on 09/08/25.
//

import SwiftUI

struct BookmarkedFeedsView: View {
    @StateObject var viewModel: FeedViewModel
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.bookmarkedFeeds) { feed in
                    FeedItemView(feed: feed) {
                        viewModel.toggleBookmark(feed: feed)
                    }
                }
            }
            .navigationTitle("Bookmarked Feeds")
            .overlay {
                if viewModel.bookmarkedFeeds.isEmpty {
                    VStack {
                        Image(systemName: "bookmark")
                            .font(.system(size: 48))
                            .foregroundColor(.gray)
                        Text("No bookmarked feeds yet")
                            .font(.title2)
                            .foregroundColor(.gray)
                            .padding(.top, 16)
                    }
                }
            }
        }
    }
}
