//
//  SecondPresenter.swift
//  ExampleVipew
//
//  Created by yana mulyana on 16/07/18.
//  Copyright © 2018 yana mulyana. All rights reserved.
//

import Foundation
import UIKit

class SecondPresenter:SecondViewToPresenterProtocol {
    
    var interactor: SecondPresenterToInteractorProtocol?
    var view: SecondPresenterToViewProtocol?
    var router: SecondPresenterRouterProtocol?
    
    func updateView() {
        interactor?.fetchName()
    }
    
    func gotoDetail(nav: UIViewController, contactResult: Contact) {
        let detailController = DetailRouter.createModule(contactResult: contactResult)
        nav.navigationController?.pushViewController(detailController, animated: true)
    }
    
    func dismissView(nav: UIViewController) {
        nav.dismiss(animated: true, completion: nil)
    }
}

extension SecondPresenter: SecondInteractorToPresenterProtocol {
    func secondViewLoading() {
        view?.hideHud()
    }
    
    func secondFetchedName(name: ContactResult) {
        view?.showName(name: name)
    }
    
    func secondFetchedNameFailed(errorName: String ,statusCode: Int) {
        view?.showError(errorName: errorName ,statusCode: statusCode)
    }
    
}
