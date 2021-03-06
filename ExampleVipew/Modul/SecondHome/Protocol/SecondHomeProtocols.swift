//
//  SecondHomeProtocols.swift
//  ExampleVipew
//
//  Created by yana mulyana on 16/07/18.
//  Copyright © 2018 yana mulyana. All rights reserved.
//

import Foundation
import UIKit

protocol SecondPresenterRouterProtocol: class {
    static func createModule() -> UIViewController
}

protocol SecondViewToPresenterProtocol: class {
    var view: SecondPresenterToViewProtocol? {get set}
    var interactor: SecondPresenterToInteractorProtocol? {get set}
    var router: SecondPresenterRouterProtocol? {get set}
    
    func updateView()
    func gotoDetail(nav: UIViewController, contactResult: Contact)
    func dismissView(nav: UIViewController)
}

protocol SecondPresenterToInteractorProtocol {
    var presenter: SecondInteractorToPresenterProtocol? {get set}
    func fetchName()
}

protocol SecondInteractorToPresenterProtocol: class {
    func secondFetchedName(name: ContactResult)
    func secondFetchedNameFailed(errorName: String ,statusCode: Int)
    func secondViewLoading()
}

protocol SecondPresenterToViewProtocol {
    func showName(name: ContactResult)
    func showError(errorName: String ,statusCode: Int)
    func hideHud()
}
