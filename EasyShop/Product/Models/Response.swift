//
//  Response.swift
//  EasyShop
//
//  Created by Vikram Rajpoot on 01/06/19.
//  Copyright © 2019 Vikram Rajpoot. All rights reserved.
//

import Foundation

public struct Response: Codable {
    var categories:[Category]
    var rankings:[Ranking]
}
