//
//  NewsModel.swift
//  DailyNews
//
//  Created by Joseph Bouhanef on 2020-11-20.
//

import Foundation

struct ArticlesResults: Decodable  {
    let articles: [Articles]
}


struct Articles: Decodable {
    
//    let source: [String: String]?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
}

//struct Source: Decodable {
//    let id: String?
//    let name: String?
//}
