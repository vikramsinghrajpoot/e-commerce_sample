//
//  RankingCollectionViewCell.swift
//  EasyShop
//
//  Created by Vikram Rajpoot on 01/06/19.
//  Copyright © 2019 Vikram Rajpoot. All rights reserved.
//

import UIKit

class RankingCollectionViewCell: UICollectionViewCell {
    @IBOutlet private weak var productName: UILabel!
    @IBOutlet private weak var views: UILabel!
    @IBOutlet private weak var imageView: UIImageView!
    
    func configureCell(product: Product, views: Int, title: String) {
        self.productName.text = product.name
//        let name = "\(product.name!).png".trim
        self.views.text = "\(title): \(views)"
//        self.imageView.image = UIImage(named: name)
    }
}
