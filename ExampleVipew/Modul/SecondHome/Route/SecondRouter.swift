//
//  SecondRouter.swift
//  ExampleVipew
//
//  Created by yana mulyana on 16/07/18.
//  Copyright © 2018 yana mulyana. All rights reserved.
//

import Foundation
import UIKit

class SecondRouter: BaseClass, SecondPresenterRouterProtocol {
    static func createModule() -> UIViewController {
        let view = mainStoryBoard.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        var interactor: SecondPresenterToInteractorProtocol = SecondInteractor()
        let presenter: SecondViewToPresenterProtocol & SecondInteractorToPresenterProtocol = SecondPresenter()
        let router: SecondPresenterRouterProtocol = SecondRouter()
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        view.presenter = presenter
        interactor.presenter = presenter
        
        return view
    }
    
}
