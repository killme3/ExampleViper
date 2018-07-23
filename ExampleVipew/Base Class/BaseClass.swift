//
//  BaseClass.swift
//  ExampleVipew
//
//  Created by yana mulyana on 18/07/18.
//  Copyright © 2018 yana mulyana. All rights reserved.
//

import Foundation
import UIKit

class BaseClass: UIViewController {
    
    static func mainStoryBoard(storyName: String) -> UIStoryboard {
        return UIStoryboard(name: storyName, bundle: Bundle.main)
    }
    
    func showEmptyView(errorName: String, emptyView: EmptyView) {
        emptyView.lblEmptyView.text = errorName
        emptyView.isHidden = false
        self.view.bringSubview(toFront: emptyView)
    }
    
    func hideEmptyView(emptyView: EmptyView) {
        emptyView.isHidden = true
        self.view.sendSubview(toBack: emptyView)
    }
    
    func showAlert(errorName: String, statusCode: Int) {
        let alert = UIAlertController(title: "Alert", message: "Problem, \(errorName), status code: \(statusCode)", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}
