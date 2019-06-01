//
//  RankinTableViewCell.swift
//  EasyShop
//
//  Created by Vikram Rajpoot on 01/06/19.
//  Copyright © 2019 Vikram Rajpoot. All rights reserved.
//

import UIKit

class RankingTableViewCell: UITableViewCell {
    @IBOutlet private weak var collectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.registerCell()
    }
    
    func registerCollectionView<T: UICollectionViewDataSource & UICollectionViewDelegate>(datasource: T, index: Int) {
        self.collectionView.delegate = datasource
        self.collectionView.dataSource = datasource
        self.collectionView.tag = index
        self.collectionView.reloadData()
    }
    
    private func registerCell() {
        let nib = UINib(nibName: CategoryCollectionViewCell.reuseIdentifier, bundle: nil)
        self.collectionView.register(nib, forCellWithReuseIdentifier: CategoryCollectionViewCell.reuseIdentifier)
    }
}
