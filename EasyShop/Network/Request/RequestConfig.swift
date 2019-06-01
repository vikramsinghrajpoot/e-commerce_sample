//
//  RequestConfig.swift
//  EasyShop
//
//  Created by Vikram Rajpoot on 01/06/19.
//  Copyright © 2019 Vikram Rajpoot. All rights reserved.
//

public class RequestConfig {
    static let baseUrl = "https://stark-spire-93433.herokuapp.com/json"
    static let requestTimeout = 30
    static let defaultHeaders: HTTPHeaders = [
        "Content-Type": "application/json",
    ]
}
