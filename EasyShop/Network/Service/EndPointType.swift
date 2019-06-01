//
//  Endpoint.swift
//  EasyShop
//
//  Created by Vikram Rajpoot on 01/06/19.
//  Copyright © 2019 Vikram Rajpoot. All rights reserved.
//

import Foundation

public typealias HTTPHeaders = [String: String]
public typealias RequestParams = [String: Any]

protocol EndPointType {
    var baseURL: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var bodyParams: RequestParams? { get }
    var urlParams: RequestParams? { get }
    var headers: HTTPHeaders? { get }
    var showLoader: Bool { get }
    var delegate: RequestCompleteDelegate? { get }
    var cachePolicy: URLRequest.CachePolicy? { get }
}

extension EndPointType {
    var baseURL: URL {
        guard let url = URL(string: RequestConfig.baseUrl) else {
            fatalError("BaseUrl cannot be configured")
        }
        return url
    }
    var httpMethod: HTTPMethod {
        return .get
    }
    var headers: HTTPHeaders? {
        return nil
    }
    var urlParams: RequestParams? {
        return nil
    }
    var bodyParams: RequestParams? {
        return nil
    }
    var showLoader: Bool {
        return true
    }
    var cachePolicy: URLRequest.CachePolicy? {
        return .useProtocolCachePolicy
    }
}
