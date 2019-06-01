//
//  Category.swift
//  EasyShop
//
//  Created by Vikram Rajpoot on 01/06/19.
//  Copyright © 2019 Vikram Rajpoot. All rights reserved.
//

import Foundation

public struct Category: Codable {
    var id: Int?
    var products: [Product]?
    var name: String?
}

public struct Product: Codable {
    var id: Int?
    var name: String?
    var date_added: String?
    var variants: [Variant]?
    var tax:Tax?
}

public struct Variant: Codable {
    var id: Int?
    var color: String?
    var size: Int?
    var price: Int?
}

public struct Tax: Codable {
    var name: String?
    var value: Float?
}

extension Product {
    var colorString: String {
        guard let variants = self.variants else {
            return ""
        }
        var string = ""
        for (index, variant) in variants.enumerated() {
            if variants.count - 1 != index {
                string += variant.color! + " \(variant.size ?? 0)" + " \(variant.price ?? 0) Rs" + "\n"
            } else {
                string += variant.color! + " \(variant.size ?? 0)" + " \(variant.price ?? 0) Rs"
            }
        }
        return string
    }
    
}
