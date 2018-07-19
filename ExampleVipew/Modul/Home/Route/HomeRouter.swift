//
//  HomeRouter.swift
//  ExampleVipew
//
//  Created by yana mulyana on 23/05/18.
//  Copyright © 2018 yana mulyana. All rights reserved.
//

import Foundation
import UIKit

class HomeRouter: BaseClass, HomePresenterToRouterProcotol {
    static func createModule() -> UIViewController {
        
//        let navController = mainStoryBoard.instantiateViewController(withIdentifier: "firstNav")    //option 1 first embed navigation controller in home controller
//        if let view = navController.childViewControllers.first as? HomeViewController {
            let view = mainStoryBoard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
            var interactor: HomePresenterToInteractorProtocol = HomeInteractor()
            let presenter: HomeViewToPresenterProtocol & HomeInteractorToPresenterProtocol = HomePresenter()
            let router: HomePresenterToRouterProcotol = HomeRouter()
        
            presenter.view = view
            presenter.router = router
            presenter.interactor = interactor
            
            view.presenter = presenter
            interactor.presenter = presenter
            
            return view
//        }
//        return UIViewController()
        
    }
    
}
