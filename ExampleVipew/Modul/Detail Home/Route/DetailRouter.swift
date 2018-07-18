//
//  DetailRouter.swift
//  ExampleVipew
//
//  Created by yana mulyana on 17/07/18.
//  Copyright © 2018 yana mulyana. All rights reserved.
//

import Foundation
import UIKit

class DetailRouter: DetailPresenterRouterProtocol {
    static func createModule(contactResult: Contact) -> UIViewController {
        let view = mainStoryBoard.instantiateViewController(withIdentifier: "DetailHomeViewController") as! DetailHomeViewController
        view.item = contactResult
        
        return view
    }
    
    static var mainStoryBoard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
}
