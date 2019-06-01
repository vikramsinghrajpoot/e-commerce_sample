//
//  ProductEndPoint.swift
//  EasyShop
//
//  Created by Vikram Rajpoot on 01/06/19.
//  Copyright © 2019 Vikram Rajpoot. All rights reserved.
//

import Foundation

class ProductEndPoint: EndPointType {
    var path: String = ""
    var bodyParams: RequestParams?
    weak var delegate: RequestCompleteDelegate?
    var cachePolicy: URLRequest.CachePolicy? {
        return .returnCacheDataElseLoad
    }
}
