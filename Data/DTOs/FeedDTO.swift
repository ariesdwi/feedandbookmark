//
//  FeedDto.swift
//  testdansmultipro
//
//  Created by PT Siaga Abdi Utama on 09/08/25.
//
import Domain
import Foundation

public struct FeedDTO: Decodable {
    public let id: String
    public let author: String
    public let width: Int
    public let height: Int
    public let url: String
    public let downloadUrl: String

    enum CodingKeys: String, CodingKey {
        case id
        case author
        case width
        case height
        case url
        case downloadUrl = "download_url" // map snake_case to camelCase
    }

    public init(id: String, author: String, width: Int, height: Int, url: String, downloadUrl: String) {
        self.id = id
        self.author = author
        self.width = width
        self.height = height
        self.url = url
        self.downloadUrl = downloadUrl
    }

    /// Convert API DTO → Domain model
    public func toDomain(isBookmarked: Bool = false, isLiked: Bool = false) -> Feed {
        Feed(
            id: id,
            title: author,           // Map `author` → `title` in your domain
            imageUrl: downloadUrl,   // Map download_url → imageUrl
            isBookmarked: isBookmarked,
            isLiked: isLiked
        )
    }
}
