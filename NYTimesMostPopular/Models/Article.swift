//
//  Article.swift
//  NYTimesMostPopular
//
//  Created by Munadel Qubbaj on 10/1/18.
//  Copyright © 2018 Munadel Qubbaj. All rights reserved.
//

import Foundation

enum MediaFormat: String, Codable {
    case square = "square320"
    case standardThumb = "Standard Thumbnail"
    case normal = "Normal"
    case large = "Large"
    case jumbo = "Jumbo"
    case superJumbo = "superJumbo"
    case square640 = "square640"
    case largeThumb = "Large Thumbnail"
    case smallMedium = "mediumThreeByTwo210"
    case bigMedium = "mediumThreeByTwo440"
}

struct NYTMostPopularArticlesResponse: Decodable {
    var numResults: Int?
    var results: [ArticlesResults]?
}

struct ArticlesResults: Decodable {
    var url : String?
    var section: String?
    var type: String?
    var title : String?
    var abstract: String?
    var publishedDate: String?
    var source: String?
    var id: Int?
    var views: Int?
    var media: [ArticleMedia]?
}

struct ArticleMedia: Decodable {
    var type: String?
    var subtype: String?
    var caption: String?
    var mediaMetadata: [ArticleMediaMetaData]?

    enum ArticleMediaCodingKeys: String, CodingKey {
        case mediaMetadata = "media-metadata"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ArticleMediaCodingKeys.self)
        mediaMetadata = try container.decode([ArticleMediaMetaData]?.self, forKey: .mediaMetadata)
    }

}

struct ArticleMediaMetaData: Decodable {
    var url: String?
    var format: MediaFormat?
    var height: Int?
    var width: Int?
}
