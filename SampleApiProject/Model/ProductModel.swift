//
//  ProductModel.swift
//  SampleApiProject
//
//  Created by Pranjal Agarwal on 14/02/23.
//

import Foundation

struct ProductApiResposne: Decodable {
    let products: [Product]?
    let status:String?
    let message:String?
}

struct Product: Decodable {
    let title,description,brand,thumbnail: String
    let price,stock: Int
    var isLiked: Bool? = false
    var id: UUID? = UUID()
    enum CodingKeys:String,CodingKey {
        case title,description,brand,thumbnail,price,stock
    }
}

