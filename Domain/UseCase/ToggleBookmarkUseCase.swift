//
//  ToggleBookmarkUseCase.swift
//  testdansmultipro
//
//  Created by PT Siaga Abdi Utama on 09/08/25.
//

import Foundation
import Combine

public protocol ToggleBookmarkUseCaseProtocol {
    func execute(feed: Feed) -> AnyPublisher<Feed, Never>
}

public final class ToggleBookmarkUseCase: ToggleBookmarkUseCaseProtocol {
    private let repository: FeedRepositoryProtocol
    
    public init(repository: FeedRepositoryProtocol) {
        self.repository = repository
    }
    
    public func execute(feed: Feed) -> AnyPublisher<Feed, Never> {
        repository.toggleBookmark(feed: feed)
    }
}
