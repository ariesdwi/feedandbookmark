//
//  CategoryRepositoryProtocol.swift
//  Casha
//
//  Created by PT Siaga Abdi Utama on 25/07/25.
//

import Foundation
import Combine

public protocol FeedRepositoryProtocol {
    func fetchFeeds(page: Int, limit: Int) async throws -> [Feed]
    func toggleBookmark(feed: Feed) -> AnyPublisher<Feed, Never>
    func getBookmarkedFeeds() -> AnyPublisher<[Feed], Never>
}
