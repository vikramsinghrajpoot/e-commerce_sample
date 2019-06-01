//
//  ProductServiceInterector.swift
//  EasyShop
//
//  Created by Vikram Rajpoot on 01/06/19.
//  Copyright © 2019 Vikram Rajpoot. All rights reserved.
//

import Foundation

protocol ProductServiceObserving: class {
    func productServiceFailed(_ error: AppError?)
    func productServiceSucceeded(_ endpoint: EndPointType, _ model: Response)
}

protocol ProductServiceInteracting: class {
    var observer: ProductServiceObserving? { get set }
    func request()
}

class ProductServiceInteractor: ProductServiceInteracting, RequestCompleteDelegate {
    
    weak var observer: ProductServiceObserving?
    let requestManager: RequestInteracting
    
    init(requestManager: RequestInteracting = RequestManager.shared) {
        self.requestManager = requestManager
    }
    
    func done(for endpoint: EndPointType, model: Decodable?) {
        if let response = model as? Response {
            self.observer?.productServiceSucceeded(endpoint, response)
        }
    }
    
    func failed(for endpoint: EndPointType, error: AppError?) {
        self.observer?.productServiceFailed(error)
    }
    
    func request() {
        let endpoint = ProductEndPoint()
        endpoint.delegate = self
        requestManager.request(for: endpoint, resultType: Response.self)
    }
}
