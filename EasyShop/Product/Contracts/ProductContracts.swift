//
//  ProductContracts.swift
//  EasyShop
//
//  Created by Vikram Rajpoot on 01/06/19.
//  Copyright © 2019 Vikram Rajpoot. All rights reserved.
//

import Foundation

protocol RatingsViewDisplaying {
    func showError(message: String)
    func showRankings(rankings: [Ranking])
    func showLoading()
    func hideLoading()
}

protocol ProductViewModelDelegate {
    func getRankingsCount() -> Int
    func rankingFor(index: Int) -> Ranking
    func getProductsCountfor(section: Int) -> Int
    func getTitlefor(row: Int) -> String
    func getProductFor(id: Int) -> Product?
    func getRankingProductFor(section: Int, row: Int) -> ProductRanking?
    func getCategoriesCount() -> Int
    func getCategoryProductFor(section: Int, row: Int) -> Product?
    func getCategoryFor(row: Int) -> Category?
    func productDetailsDidSelected(section: Int, row: Int)
}

protocol ProductRouting {
    func pushToProductDetailsFrom(view: ProductViewController, products: [Product])
}

enum RankingType: Int {
    case viewed
    case ordered
    case shared
    func title() -> String {
        switch self {
        case .viewed:
            return "Viewed by"
        case .ordered:
            return "Ordered by"
        case .shared:
            return "Shared by"
        }
    }
}

enum SectionType {
    case categories
    case ranking
}

