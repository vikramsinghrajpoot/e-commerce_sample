//
//  CategoryCollectionViewCell.swift
//  EasyShop
//
//  Created by Vikram Rajpoot on 31/05/19.
//  Copyright © 2019 Vikram Rajpoot. All rights reserved.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var categoryName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configureCell(category: Category) {
        self.categoryName.text = category.name
        let name = "\(category.name!).png".trim
        self.imageView.image = UIImage(named: name)
    }
}
