//
//  HomeProtocols.swift
//  ExampleVipew
//
//  Created by yana mulyana on 23/05/18.
//  Copyright © 2018 yana mulyana. All rights reserved.
//

import Foundation
import UIKit

protocol HomePresenterRouterProcotol: class {
    static func createModule() -> UIViewController
}

protocol HomeViewToPresenterProtocol: class {
    var view: HomePresenterToViewProtocol? {get set}
    var interactor: HomePresenterToInteractorProtocol? {get set}
    var router: HomePresenterRouterProcotol? {get set}
    
    func updateView()
    func gotoSecondView(nav: UIViewController)
}

protocol HomePresenterToInteractorProtocol {
    var presenter: HomeInteractorToPresenterProtocol? {get set}
    func fetchHome()
}

protocol HomeInteractorToPresenterProtocol: class {
    func homeFetched(news: ContactResult)
    func homeFetchedFailed()
}

protocol HomePresenterToViewProtocol {
    func showNews(news: ContactResult)
    func showError()
}



