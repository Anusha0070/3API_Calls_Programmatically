//
//  NewsModel.swift
//  3API_Call
//
//  Created by Anusha Raju on 12/16/24.
//

struct News: Codable{
    let articles: [Articles]
}

struct Articles: Codable{
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
}
