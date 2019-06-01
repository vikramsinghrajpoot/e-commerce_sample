//
//  UIStoryboard.swift
//  EasyShop
//
//  Created by Vikram Rajpoot on 01/06/19.
//  Copyright © 2019 Vikram Rajpoot. All rights reserved.
//

import UIKit

extension UIStoryboard {
   static var main: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: nil)
    }
    
    static var productDetailsViewController: ProductDetailsViewController? {
        return main.instantiateViewController(withIdentifier: ProductDetailsViewController.storyboardIdentifier) as? ProductDetailsViewController
    }
}
