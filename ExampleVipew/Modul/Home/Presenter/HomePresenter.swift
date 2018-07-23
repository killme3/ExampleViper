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
        let secondController = SecondRouter.createModule()
        
//        nav.navigationController?.pushViewController(secondController, animated: true) // option 1 first embed navigation controller in home controller
//        setRootViewController()   // option 2 set root view controller
        let secondNav = UINavigationController(rootViewController: secondController)    // option 3 present navigation
        nav.present(secondNav, animated: true, completion: nil)
        
    }
    
    func gotoProfile(nav: UIViewController) {
        let profileController = ProfilePresenterToRouter.createModule()
        let secondNav = UINavigationController(rootViewController: profileController)
        nav.present(secondNav, animated: true, completion: nil)
    }
    
    func setRootViewController() {
        let secondController = SecondRouter.createModule()
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        let secondNav = UINavigationController(rootViewController: secondController)
        appdelegate.window!.rootViewController = secondNav
    }
    
}

extension HomePresenter: HomeInteractorToPresenterProtocol {
   func homeViewLoading() {
        view?.hideHud()
    }
    
    func homeFetched(news: ContactResult) {
        view?.showNews(news: news)
    }
    
    func homeFetchedFailed(errorName: String, statusCode: Int) {
        view?.showError(errorName: errorName, statusCode: statusCode)
    }
    
}
