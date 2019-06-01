//
//  AppError.swift
//  EasyShop
//
//  Created by Vikram Rajpoot on 01/06/19.
//  Copyright © 2019 Vikram Rajpoot. All rights reserved.
//

import Foundation

struct AppError: Codable {
    let message: String
    let statusCode: Int
    let upgradeUrl: String?
}
