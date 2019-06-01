//
//  ProductRouter.swift
//  EasyShop
//
//  Created by Vikram Rajpoot on 01/06/19.
//  Copyright © 2019 Vikram Rajpoot. All rights reserved.
//

import Foundation

final class ProductRouter: ProductRouting {
    func pushToProductDetailsFrom(view: ProductViewController, products: [Product]) {
        if let controller = ProductDetailsRouter.make() {
            controller.product = products
            view.navigationController?.pushViewController(controller, animated: true)
        }
    }
}
