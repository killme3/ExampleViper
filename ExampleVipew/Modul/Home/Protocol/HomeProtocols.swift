//
//  HomeProtocols.swift
//  ExampleVipew
//
//  Created by yana mulyana on 23/05/18.
//  Copyright © 2018 yana mulyana. All rights reserved.
//

import Foundation
import UIKit

protocol HomePresenterToRouterProcotol: class {
    static func createModule() -> UIViewController
}

protocol HomeViewToPresenterProtocol: class {
    var view: HomePresenterToViewProtocol? {get set}
    var interactor: HomePresenterToInteractorProtocol? {get set}
    var router: HomePresenterToRouterProcotol? {get set}
    
    func updateView()
    func gotoSecondView(nav: UIViewController)
    func gotoProfile(nav: UIViewController)
    func setRootViewController()
}

protocol HomePresenterToViewProtocol {
    func showNews(news: ContactResult)
    func showError(errorName: String, statusCode: Int)
    func hideHud()
}

protocol HomePresenterToInteractorProtocol {
    var presenter: HomeInteractorToPresenterProtocol? {get set}
    func fetchHome()
}

protocol HomeInteractorToPresenterProtocol: class {
    func homeFetched(news: ContactResult)
    func homeFetchedFailed(errorName: String ,statusCode: Int)
    func homeViewLoading()
}





