//
//  GetBookmarkedFeedsUseCase.swift
//  testdansmultipro
//
//  Created by PT Siaga Abdi Utama on 09/08/25.
//

import Foundation
import Combine

public protocol GetBookmarkedFeedsUseCaseProtocol {
    func execute() -> AnyPublisher<[Feed], Never>
}

public final class GetBookmarkedFeedsUseCase: GetBookmarkedFeedsUseCaseProtocol {
    private let repository: FeedRepositoryProtocol
    
    public init(repository: FeedRepositoryProtocol) {
        self.repository = repository
    }
    
    public func execute() -> AnyPublisher<[Feed], Never> {
        repository.getBookmarkedFeeds()
    }
}
