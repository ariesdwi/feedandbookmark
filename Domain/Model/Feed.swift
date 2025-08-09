//
//  TransactionSection.swift
//  Casha
//
//  Created by PT Siaga Abdi Utama on 15/07/25.
//
import Foundation

public struct Feed: Identifiable, Equatable {
    public let id: String
    public let author: String
    public let imageUrl: String
    public var isBookmarked: Bool
    
    public init(
        id: String,
        author: String,
        imageUrl: String,
        isBookmarked: Bool
    ) {
        self.id = id
        self.author = author
        self.imageUrl = imageUrl
        self.isBookmarked = isBookmarked
    }
}


