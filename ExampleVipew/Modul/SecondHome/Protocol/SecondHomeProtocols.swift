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
}

protocol SecondPresenterToInteractorProtocol {
    var presenter: SecondInteractorToPresenterProtocol? {get set}
    func fetchName()
}

protocol SecondInteractorToPresenterProtocol: class {
    func secondFetchedName(name: ContactResult)
    func secondFetchedNameFailed()
}

protocol SecondPresenterToViewProtocol {
    func showName(name: ContactResult)
    func showError()
}
