//
//  TransactionSyncManager.swift
//  Casha
//
//  Created by PT Siaga Abdi Utama on 24/07/25.
//

// Data/Repositories/FeedRepositoryImpl.swift
import Combine
import Core
import Domain

public final class FeedRepositoryImpl: FeedRepositoryProtocol {
    private let apiClient: NetworkClient
    private var bookmarkedFeeds = CurrentValueSubject<[Feed], Never>([])

    public init(apiClient: NetworkClient) {
        self.apiClient = apiClient
    }

    public func fetchFeeds(page: Int, limit: Int) async throws -> [Feed] {
        let endpoint = FeedEndpoints.feeds(page: page, limit: limit)
        let dtos = try await apiClient.request(
            endpoint,
            parameters: nil,
            headers: nil,
            responseType: [FeedDTO].self
        )

        let bookmarkedIds = Set(bookmarkedFeeds.value.map { $0.id })
        return dtos.map {
            $0.toDomain(isBookmarked: bookmarkedIds.contains($0.id))
        }
    }

    public func toggleBookmark(feed: Feed) -> AnyPublisher<Feed, Never> {
        var current = bookmarkedFeeds.value

        if let index = current.firstIndex(where: { $0.id == feed.id }) {
            current.remove(at: index)
        } else {
            current.append(feed)
        }

        bookmarkedFeeds.send(current)

        // Return updated feed with new bookmark state
        let updatedFeed = Feed(
            id: feed.id,
            title: feed.title,
            imageUrl: feed.imageUrl,
            isBookmarked: current.contains(where: { $0.id == feed.id }),
            isLiked: feed.isLiked
        )

        return Just(updatedFeed).eraseToAnyPublisher()
    }

    public func getBookmarkedFeeds() -> AnyPublisher<[Feed], Never> {
        bookmarkedFeeds.eraseToAnyPublisher()
    }
}

