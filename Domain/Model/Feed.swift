//
//  TransactionSection.swift
//  Casha
//
//  Created by PT Siaga Abdi Utama on 15/07/25.
//
import Foundation

public struct Feed: Identifiable, Codable {
    public let id: String
    public let title: String
    public let imageUrl: String
    public var isBookmarked: Bool
    public var isLiked: Bool

    public init(id: String, title: String, imageUrl: String, isBookmarked: Bool = false, isLiked: Bool = false) {
        self.id = id
        self.title = title
        self.imageUrl = imageUrl
        self.isBookmarked = isBookmarked
        self.isLiked = isLiked
    }
}



