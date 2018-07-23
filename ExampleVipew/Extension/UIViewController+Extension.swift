//
//  UIViewController+Extension.swift
//  ExampleVipew
//
//  Created by yana mulyana on 20/07/18.
//  Copyright © 2018 yana mulyana. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func hideNavigationBar(){
        // Hide the navigation bar on the this view controller
        self.navigationController?.navigationBar.isHidden = true
        
    }
    
    func showNavigationBar() {
        // Show the navigation bar on other view controllers
        self.navigationController?.navigationBar.isHidden = false
    }
    
}
