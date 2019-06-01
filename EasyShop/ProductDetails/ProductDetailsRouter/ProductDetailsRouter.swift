//
//  ProductDetailsRouter.swift
//  EasyShop
//
//  Created by Vikram Rajpoot on 01/06/19.
//  Copyright © 2019 Vikram Rajpoot. All rights reserved.
//

import UIKit

final class ProductDetailsRouter {
    class func make() -> ProductDetailsViewController?  {
        let controller = UIStoryboard.productDetailsViewController
        return controller
    }
}
