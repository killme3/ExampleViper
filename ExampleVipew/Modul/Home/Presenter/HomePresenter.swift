//
//  HomePresenter.swift
//  ExampleVipew
//
//  Created by yana mulyana on 23/05/18.
//  Copyright © 2018 yana mulyana. All rights reserved.
//

import Foundation

// Presenter => dari presenter to interactor
// Presenter => dari interactor to presenter


class HomePresenter: HomeViewToPresenterProtocol {
    
    var interactor: HomePresenterToInteractorProtocol?
    var view: HomePresenterToViewProtocol?
    var router: HomePresenterRouterProcotol?
    
    func updateView() {
        interactor?.fetchHome()
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
