//
//  DetailHomeProtocols.swift
//  ExampleVipew
//
//  Created by yana mulyana on 17/07/18.
//  Copyright © 2018 yana mulyana. All rights reserved.
//

import Foundation
import UIKit

protocol DetailPresenterRouterProtocol: class {
    static func createModule(contactResult: Contact) -> UIViewController
}

protocol DetailViewToPresenterProtocol: class {
    var view: DetailPresenterToViewProtocol? {get set}
    
    func getData(data: Contact)
}

protocol DetailPresenterToViewProtocol {
    func setData(item: Contact)
}
