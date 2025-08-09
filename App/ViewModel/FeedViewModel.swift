//
//  FeedViewModel.swift
//  testdansmultipro
//
//  Created by PT Siaga Abdi Utama on 09/08/25.
//
import Foundation
import Combine
import Data
import Domain

class FeedViewModel: ObservableObject {
    private let repository: FeedRepositoryImpl
    private var cancellables = Set<AnyCancellable>()
    
    @Published var feeds: [Feed] = []
    @Published var bookmarkedFeeds: [Feed] = []
    @Published var isLoading = false
    @Published var error: Error?
    
    private var currentPage = 1
    private let limit = 10
    
    init(repository: FeedRepositoryImpl) {
        self.repository = repository
        
        // Subscribe to bookmarked feeds changes
        repository.getBookmarkedFeeds()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] bookmarked in
                self?.bookmarkedFeeds = bookmarked
                // Update bookmark status in main feeds
                self?.updateBookmarkStatusInFeeds(bookmarkedIds: Set(bookmarked.map { $0.id }))
            }
            .store(in: &cancellables)
    }
    
    func fetchInitialFeeds() {
        currentPage = 1
        isLoading = true
        error = nil
        
        Task {
            do {
                let newFeeds = try await repository.fetchFeeds(page: currentPage, limit: limit)
                await MainActor.run {
                    self.feeds = newFeeds
                    self.isLoading = false
                }
            } catch {
                await MainActor.run {
                    self.error = error
                    self.isLoading = false
                }
            }
        }
    }
    
    func loadMoreFeeds() {
        currentPage += 1
        isLoading = true
        
        Task {
            do {
                let newFeeds = try await repository.fetchFeeds(page: currentPage, limit: limit)
                await MainActor.run {
                    self.feeds += newFeeds
                    self.isLoading = false
                }
            } catch {
                await MainActor.run {
                    self.error = error
                    self.isLoading = false
                }
            }
        }
    }
    
    func toggleBookmark(feed: Feed) {
        repository.toggleBookmark(feed: feed)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] updatedFeed in
                // Update the feed in both arrays
                if let index = self?.feeds.firstIndex(where: { $0.id == updatedFeed.id }) {
                    self?.feeds[index] = updatedFeed
                }
            }
            .store(in: &cancellables)
    }
    
    private func updateBookmarkStatusInFeeds(bookmarkedIds: Set<String>) {
        for i in 0..<feeds.count {
            feeds[i].isBookmarked = bookmarkedIds.contains(feeds[i].id)
        }
    }
}
