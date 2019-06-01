//
//  RequestManager.swift
//  EasyShop
//
//  Created by Vikram Rajpoot on 01/06/19.
//  Copyright © 2019 Vikram Rajpoot. All rights reserved.
//

import Foundation

class RequestManager: RequestInteracting {
    
    private var task: URLSessionTask?

    static private var urlSession: URLSession {
        return self.buildUrlSession()
    }

    class var shared: RequestManager {
        struct Static { static let instance = RequestManager()}
        return Static.instance
    }
    
    func request<T: Decodable>( for endpoint: EndPointType, resultType: T.Type) {
        if !Reachability.isConnectedToNetwork() {
            NotificationCenter.default.post(name: Notification.Name("NoInternetConnection"), object: nil)
            let error =
                AppError.init(message: Constants.message.noInternet,
                             statusCode: HTTPStatus.noInternet.rawValue,
                             upgradeUrl: nil)
            DispatchQueue.main.async {
                endpoint.delegate?.failed(for: endpoint, error: error)
            }
        } else { do {
            let request = try self.buildRequest(from: endpoint)
            #if DEBUG
            NetworkLogger.log(request: request)
            #endif
            self.task = RequestManager.urlSession.dataTask(with: request) { (data, response, error) in
                guard let dataResponse = data, error == nil else {
                    DispatchQueue.main.async {
                        endpoint.delegate?.failed(for: endpoint, error: nil)
                    }
                    return
                }
                do {
                    let decoder = JSONDecoder()
                    if let statusCode = response?.value(forKey: "statusCode") as? Int, statusCode != HTTPStatus.success.rawValue {
                        try self.errorBlock(endpoint: endpoint, dataResponse: dataResponse, statusCode: statusCode)
                    } else {
                        let model = try decoder.decode(resultType, from: dataResponse)
                        DispatchQueue.main.async {
                            endpoint.delegate?.done(for: endpoint, model: model)
                        }
                    }
                } catch {
                    DispatchQueue.main.async {
                        endpoint.delegate?.failed(for: endpoint, error: nil)
                    }
                }
            }
            self.task?.resume()
        } catch {
            DispatchQueue.main.async {
                endpoint.delegate?.failed(for: endpoint, error: nil)
            }
        }
    }
    }
    
    func cancel() {
        self.task?.cancel()
    }
    
    private func errorBlock(endpoint: EndPointType, dataResponse: Data, statusCode: Int) throws {
        let decoder = JSONDecoder()
        let error = try decoder.decode(AppError.self, from: dataResponse)
        endpoint.delegate?.failed(for: endpoint, error: error)
    }
    
    private func buildRequest(from endpoint: EndPointType) throws -> URLRequest {
        let url = endpoint.baseURL.appendingPathComponent(endpoint.path)
        var request = URLRequest(url: url)
        request.cachePolicy = endpoint.cachePolicy!
        request.httpMethod = endpoint.httpMethod.rawValue
        let headers = RequestConfig.defaultHeaders
        for (key, value) in headers {
            request.addValue(value, forHTTPHeaderField: key)
        }

        let urlParams = endpoint.urlParams ?? [:]
        if !urlParams.isEmpty {
            do {
                try URLParameterEncoder.encode(request: &request, with: urlParams)
            } catch {
                throw error
            }
        }
        
        if let data = endpoint.bodyParams {
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: data, options: .prettyPrinted)
            } catch {
                throw error
            }
        }
        return request
    }

    private static func buildUrlSession() -> URLSession {
        let sessionConfiguration = URLSessionConfiguration.default
        sessionConfiguration.urlCache = URLCache.shared
        sessionConfiguration.timeoutIntervalForRequest = TimeInterval(RequestConfig.requestTimeout)
        let urlSession = URLSession.init(configuration: sessionConfiguration)
        return urlSession
    }
}
