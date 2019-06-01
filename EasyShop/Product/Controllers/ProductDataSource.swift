//
//  ProductDataSource.swift
//  EasyShop
//
//  Created by Vikram Rajpoot on 01/06/19.
//  Copyright © 2019 Vikram Rajpoot. All rights reserved.
//

import UIKit

class ProductDataSource: NSObject {
    private var productViewModel: ProductViewModel!
    private var width: CGFloat {
        return (UIScreen.main.bounds.size.width - 20 ) / 2
    }
    init(viewModel: ProductViewModel) {
        self.productViewModel = viewModel
    }
}

extension ProductDataSource: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RankingTableViewCell.reuseIdentifier) as? RankingTableViewCell
        cell?.registerCollectionView(datasource: self, index: indexPath.section)
        return cell!
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.productViewModel.getRankingsCount() + 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 3 ? "Categories" : self.productViewModel.getTitlefor(row: section)
    }
}

extension ProductDataSource: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionView.tag == 3 ? self.productViewModel.getCategoriesCount() : self.productViewModel.getProductsCountfor(section: collectionView.tag)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView.tag == 3 {//Categories
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.reuseIdentifier , for: indexPath) as? CategoryCollectionViewCell
            if let category = self.productViewModel.getCategoryFor(row: indexPath.row) {
                cell?.configureCell(category: category)
            }
            return cell!
        } else {//Rankings
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RankingCollectionViewCell.reuseIdentifier , for: indexPath) as? RankingCollectionViewCell
            if let id = self.productViewModel.getRankingProductFor(section: collectionView.tag, row: indexPath.item)?.id{
                let views = self.productViewModel.getRankingProductFor(section: collectionView.tag, row: indexPath.item)?.view_count
                if let product = self.productViewModel.getProductFor(id: id) {
                    let title = RankingType(rawValue: collectionView.tag)
                    cell?.configureCell(product: product, views: views ?? 0, title: title!.title())
                }
            }
            return cell!
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.width, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.productViewModel.productDetailsDidSelected(section: collectionView.tag, row: indexPath.row)
    }
}
