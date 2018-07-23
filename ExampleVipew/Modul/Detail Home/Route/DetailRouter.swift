//
//  DetailRouter.swift
//  ExampleVipew
//
//  Created by yana mulyana on 17/07/18.
//  Copyright © 2018 yana mulyana. All rights reserved.
//

import Foundation
import UIKit

class DetailRouter: BaseClass, DetailPresenterRouterProtocol {
    static func createModule(contactResult: Contact) -> UIViewController {
        let view = mainStoryBoard(storyName: "Main").instantiateViewController(withIdentifier: "DetailHomeViewController") as! DetailHomeViewController
        
        let presenter: DetailViewToPresenterProtocol = DetailPresenter()
        presenter.view = view
        
        view.item = contactResult
        view.presenter = presenter
        
        return view
    }
    
    
}
