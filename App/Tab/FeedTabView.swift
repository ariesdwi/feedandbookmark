//
//  FeedTabView.swift
//  testdansmultipro
//
//  Created by PT Siaga Abdi Utama on 09/08/25.
//

import SwiftUI
import Data

struct FeedTabView: View {
    @StateObject private var viewModel: FeedViewModel
    
    init(repository: FeedRepositoryImpl) {
        _viewModel = StateObject(wrappedValue: FeedViewModel(repository: repository))
    }
    
    var body: some View {
        TabView {
            FeedDashboardView(viewModel: viewModel)
                .tabItem {
                    Label("Feed", systemImage: "list.dash")
                }
            
            BookmarkedFeedsView(viewModel: viewModel)
                .tabItem {
                    Label("Bookmarks", systemImage: "bookmark")
                }
        }
    }
}
