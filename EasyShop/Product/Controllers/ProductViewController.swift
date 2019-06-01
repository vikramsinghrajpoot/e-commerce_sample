//
//  FirstViewController.swift
//  EasyShop
//
//  Created by Vikram Rajpoot on 01/06/19.
//  Copyright © 2019 Vikram Rajpoot. All rights reserved.
//

import UIKit

class ProductViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var loadingIndicator: UIActivityIndicatorView!
    private var productViewModel: ProductViewModel!
    private lazy var dataSource: ProductDataSource! = ProductDataSource(viewModel: productViewModel)

    override func viewDidLoad() {
        super.viewDidLoad()
        self.productViewModel = ProductViewModel(view: self)
        self.tableView.dataSource = self.dataSource
        self.tableView.delegate = self.dataSource
    }
}

extension ProductViewController: RatingsViewDisplaying {
    func showLoading() {
        self.loadingIndicator.startAnimating()
    }
    
    func hideLoading() {
        self.loadingIndicator.stopAnimating()
    }
    
    func showRankings(rankings: [Ranking]) {
        self.tableView.reloadData()
    }
    
    func showError(message: String) {
        self.showAlert(title: "Error", message: message)
    }
}
