//
//  ProductDetailsViewController.swift
//  EasyShop
//
//  Created by Vikram Rajpoot on 01/06/19.
//  Copyright © 2019 Vikram Rajpoot. All rights reserved.
//

import UIKit

class ProductDetailsViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    var product: [Product]!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = Constants.titles.productDetails
        self.tableView.tableFooterView = UIView()
    }
}

extension ProductDetailsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.product.count == 0 ? 1 : self.product.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if product.count == 0 { //No data
           let cell = UITableViewCell(style: .default, reuseIdentifier: ProductDetailTableViewCell.reuseIdentifier)
           cell.textLabel?.text = Constants.message.noProducts
           cell.textLabel?.textAlignment = .center
           return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: ProductDetailTableViewCell.reuseIdentifier) as? ProductDetailTableViewCell
            cell?.configureCell(product: product[indexPath.row])
            return cell!
        }
    }
}
