//
//  HomePresenter.swift
//  ExampleVipew
//
//  Created by yana mulyana on 23/05/18.
//  Copyright © 2018 yana mulyana. All rights reserved.
//

import Foundation
import UIKit

class HomePresenter: HomeViewToPresenterProtocol {
    var interactor: HomePresenterToInteractorProtocol?
    var view: HomePresenterToViewProtocol?
    var router: HomePresenterToRouterProcotol?
    
    func updateView() {
        interactor?.fetchHome()
    }
    
    func gotoSecondView(nav: UIViewController) {
//        let secondController = SecondRouter.createModule()
//        nav.navigationController?.pushViewController(secondController, animated: true)             //option 1
        
        setRootViewController()
    }
    
    func setRootViewController() {
        let secondController = SecondRouter.createModule()
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        let secondNav = UINavigationController(rootViewController: secondController)
        appdelegate.window!.rootViewController = secondNav
    }
    
}

extension HomePresenter: HomeInteractorToPresenterProtocol {
    func homeFetched(news: ContactResult) {
        view?.showNews(news: news)
    }
    
    func homeFetchedFailed() {
        view?.showError()
    }
    
}
