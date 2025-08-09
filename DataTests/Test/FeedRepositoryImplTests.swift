//
//  FeedRepositoryImplTests.swift
//  testdansmultipro
//
//  Created by PT Siaga Abdi Utama on 09/08/25.
//

import XCTest
@testable import Data
@testable import Core
@testable import Domain

final class FeedRepositoryTests: XCTestCase {
    var repository: FeedRepositoryImpl!

    override func setUp() async throws {
        try await super.setUp()
        
        // Use your real NetworkClient implementation here
        let apiClient = APIClient(baseURL: "https://picsum.photos/")
        repository = FeedRepositoryImpl(apiClient: apiClient)
    }

    func testFetchFeeds() async throws {
        let feeds = try await repository.fetchFeeds(page: 1, limit: 5)
        
        XCTAssertFalse(feeds.isEmpty, "Feeds should not be empty from API")
        print("✅ Got \(feeds.count) feeds from API")
    }
}
