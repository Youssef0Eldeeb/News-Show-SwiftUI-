//
//  Article.swift
//  News Show
//
//  Created by Youssef Eldeeb on 14/09/2023.
//

import Foundation


struct NewsResponse: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

//struct Article: Decodable {
//    let author: String
//    let title, description: String
//    let url: String?
//    let image: String
//    let date: String?
//    let content: String?
//    
//    
//    enum CodingKeys: String, CodingKey{
//        case author
//        case title
//        case url
//        case date = "publishedAt"
//        case description
//        case image = "urlToImage"
//        case content
//
//    }
//    
//}

struct Article: Codable {
    let source: Source
    let author: String?
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: String
    let content: String?
}

// MARK: - Source
struct Source: Codable {
    let id: String?
    let name: String
}
