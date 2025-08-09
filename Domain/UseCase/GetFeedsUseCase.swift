//
//  Untitled.swift
//  Casha
//
//  Created by PT Siaga Abdi Utama on 21/07/25.
//
import Foundation

public struct GetFeedsUseCase {
    private let repository: FeedRepositoryProtocol

    public init(repository: FeedRepositoryProtocol) {
        self.repository = repository
    }

    public func execute(page: Int, limit: Int) async throws -> [Feed] {
        try await repository.fetchFeeds(page: page, limit: limit)
    }
}
