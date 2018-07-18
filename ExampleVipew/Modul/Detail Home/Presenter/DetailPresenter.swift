//
//  DetailPresenter.swift
//  ExampleVipew
//
//  Created by yana mulyana on 18/07/18.
//  Copyright © 2018 yana mulyana. All rights reserved.
//

import Foundation

class DetailPresenter: DetailViewToPresenterProtocol {
    var view: DetailPresenterToViewProtocol?
    
    func getData(data: Contact) {
        view?.setData(item: data)
    }
    
}
