//
//  HTTPMethod.swift
//  EasyShop
//
//  Created by Vikram Rajpoot on 01/06/19.
//  Copyright © 2019 Vikram Rajpoot. All rights reserved.
//

import Foundation

public enum HTTPMethod: String {
    case get     = "GET"
    case post    = "POST"
    case put     = "PUT"
    case patch   = "PATCH"
    case delete  = "DELETE"
}

public enum HTTPStatus: Int {
    case success = 200
    case badRequest = 400
    case forbidden = 403
    case serverError = 500
    case noInternet = -999
}
