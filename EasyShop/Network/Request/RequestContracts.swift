//
//  QueryInteractor.swift
//  EasyShop
//
//  Created by Vikram Rajpoot on 01/06/19.
//  Copyright © 2019 Vikram Rajpoot. All rights reserved.
//

import Foundation

protocol RequestInteracting {
    func request<T: Decodable>(for endpoint: EndPointType, resultType: T.Type)
}

protocol RequestCompleteDelegate: class {
    func done(for endpoint: EndPointType, model: Decodable?)
    func failed(for endpoint: EndPointType, error: AppError?)
}

protocol RequestLoadingDelegate: class {
    func showLoadingIndicator()
    func hideLoadingIndicator()
}
