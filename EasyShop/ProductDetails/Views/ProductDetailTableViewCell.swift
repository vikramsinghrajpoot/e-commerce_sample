//
//  ProductDetailTableViewCell.swift
//  EasyShop
//
//  Created by Vikram Rajpoot on 01/06/19.
//  Copyright © 2019 Vikram Rajpoot. All rights reserved.
//

import UIKit

class ProductDetailTableViewCell: UITableViewCell {
    @IBOutlet private weak var name: UILabel!
    @IBOutlet private weak var colorWithSize: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configureCell(product: Product) {
        self.name.text = "Name: \(product.name ?? "")"
        self.colorWithSize.text = product.colorString
    }
}
