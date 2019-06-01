//
//  ProductViewModel.swift
//  EasyShop
//
//  Created by Vikram Rajpoot on 01/06/19.
//  Copyright © 2019 Vikram Rajpoot. All rights reserved.
//

import Foundation

class ProductViewModel: ProductViewModelDelegate {
    
    private let serviceInteractor: ProductServiceInteracting!
    private var response: Response?
    private weak var view: ProductViewController!
    private var router: ProductRouter!
    
    init(view: ProductViewController) {
        self.view = view
        serviceInteractor = ProductServiceInteractor()
        serviceInteractor.observer = self
        serviceInteractor.request()
        self.view.showLoading()
        self.router = ProductRouter()
    }
    
    func getRankingsCount() -> Int {
        guard let response = response else {
            return 0
        }
        return response.rankings.count
    }
    
    func rankingFor(index: Int) -> Ranking {
        return response!.rankings[index]
    }
    
    func getProductsCountfor(section: Int) -> Int {
        guard let _ = response?.rankings,
            let products = response?.rankings[section].products else {
            return 0
        }
        return products.count
    }
    
    func getTitlefor(row: Int) -> String {
        guard let _ = response?.rankings else {
            return ""
         }
        return response?.rankings[row].ranking?.capitalizingFirstLetter() ?? ""
    }
    
    func getProductFor(id: Int) -> Product? {
        var p:Product?
        guard let categories = response?.categories else {
                return p
        }
        for category in categories {
            for product in category.products! {
                if product.id == id {
                   p = product
                }
            }
        }
        return p
    }
    
    func getRankingProductFor(section: Int, row: Int) -> ProductRanking? {
        return response?.rankings[section].products?[row]
    }
    
    func getCategoriesCount() -> Int {
        return self.response?.categories.count ?? 0
    }
    
    func getCategoryProductFor(section: Int, row: Int) -> Product? {
        return response?.categories[section].products?[row]
    }
    
    func getCategoryFor(row: Int) -> Category? {
        return self.response?.categories[row]
    }
    
    func productDetailsDidSelected(section: Int, row: Int) {
        if section == 3 {//Categories
            if let category = self.getCategoryFor(row: row), let product = category.products {
                self.router.pushToProductDetailsFrom(view: view, products: product)
            }
        }else {//Rankings
            if let id = self.getRankingProductFor(section: section, row: row)?.id{
                if let product = self.getProductFor(id: id) {
                    self.router.pushToProductDetailsFrom(view: view, products: [product])
                }
            }
        }
    }
}

extension ProductViewModel : ProductServiceObserving {
    func productServiceFailed(_ error: AppError?) {
        self.view.showError(message: error?.message ?? "")
    }
    
    func productServiceSucceeded(_ endpoint: EndPointType, _ model: Response) {
        self.response = model
        self.view.showRankings(rankings: model.rankings)
        self.view.hideLoading()
    }
}
