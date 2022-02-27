//
//  File.swift
//  GoodNews
//
//  Created by 송하민 on 2022/02/27.
//

import Foundation

struct ArticlesList: Codable {
    let articles: [Article]
}

extension ArticlesList {
    static var all: Resource<ArticlesList> {
        get {
            let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=fc5cdf67188f4f90a8c096db79216aa2")!
            return Resource(url: url)
        }
    }
}

struct Article: Codable {
    let title: String
    let description: String
}
