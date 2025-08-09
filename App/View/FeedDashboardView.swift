//
//  FeedDashboardView.swift
//  testdansmultipro
//
//  Created by PT Siaga Abdi Utama on 09/08/25.
//

import SwiftUI

struct FeedDashboardView: View {
    @StateObject var viewModel: FeedViewModel
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.feeds) { feed in
                    FeedItemView(feed: feed) {
                        viewModel.toggleBookmark(feed: feed)
                    }
                    .onAppear {
                        if feed.id == viewModel.feeds.last?.id {
                            viewModel.loadMoreFeeds()
                        }
                    }
                    .listRowSeparator(.hidden)
                    .listRowInsets(EdgeInsets())
                    .contentShape(Rectangle()) // Makes entire area tappable
                    .buttonStyle(.plain)
                }
                
                if viewModel.isLoading {
                    ProgressView()
                        .frame(maxWidth: .infinity, alignment: .center)
                }
            }
            .listStyle(.plain)
            .navigationTitle("Feeds")
            .refreshable {
                viewModel.fetchInitialFeeds()
            }
            .onAppear {
                if viewModel.feeds.isEmpty {
                    viewModel.fetchInitialFeeds()
                }
            }
            .alert("Error", isPresented: .constant(viewModel.error != nil)) {
                Button("OK", role: .cancel) {
                    viewModel.error = nil
                }
                Button("Retry") {
                    viewModel.fetchInitialFeeds()
                }
            } message: {
                Text(viewModel.error?.localizedDescription ?? "Unknown error")
            }
        }
    }
}

