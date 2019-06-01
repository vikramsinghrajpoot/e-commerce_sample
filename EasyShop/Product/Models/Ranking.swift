//
//  Ranking.swift
//  EasyShop
//
//  Created by Vikram Rajpoot on 01/06/19.
//  Copyright © 2019 Vikram Rajpoot. All rights reserved.
//

import Foundation

public struct Ranking: Codable {
    var ranking: String?
    var products: [ProductRanking]?
}

public struct ProductRanking: Codable {
    var id: Int?
    var view_count: Int?
}
