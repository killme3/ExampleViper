//
//  HomeRouter.swift
//  ExampleVipew
//
//  Created by yana mulyana on 23/05/18.
//  Copyright © 2018 yana mulyana. All rights reserved.
//

import Foundation
import UIKit

class HomeRouter: HomePresenterRouterProcotol {
    static func createModule() -> UIViewController {
        let view = mainStoryBoard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        let presenter: HomeViewToPresenterProtocol & HomeInteractorToPresenterProtocol = HomePresenter()
        var interactor: HomePresenterToInteractorProtocol = HomeInteractor()
        let router: HomePresenterRouterProcotol = HomeRouter()
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        view.presenter = presenter
        interactor.presenter = presenter
        
        return view
    }
    
    static var mainStoryBoard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
}
