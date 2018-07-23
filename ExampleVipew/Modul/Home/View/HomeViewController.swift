//
//  HomeViewController.swift
//  ExampleVipew
//
//  Created by yana mulyana on 23/05/18.
//  Copyright © 2018 yana mulyana. All rights reserved.
//

import UIKit
import PKHUD

class HomeViewController: BaseClass {
    
    var presenter: HomeViewToPresenterProtocol?

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if Connectivity.isConnectedToInternet() {
            HUD.show(.progress, onView: self.view)
            presenter?.updateView()
        } else {
            showAlert(errorName: StringError.NO_INTERNET.rawValue, statusCode: 0)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func secondHomeTapped(_ sender: Any) {
        presenter?.gotoSecondView(nav: self)
    }
    
    
    @IBAction func btnProfileTapped(_ sender: Any) {
        presenter?.gotoProfile(nav: self)
    }
}

extension HomeViewController: HomePresenterToViewProtocol {
    func hideHud() {
        HUD.hide()
    }
    
    func showNews(news: ContactResult) {
        lblTitle.text = news.contact[0].name
        lblDescription.text = news.contact[0].address
    }
    
    func showError(errorName: String, statusCode: Int) {
        showAlert(errorName: errorName, statusCode: statusCode)
    }
    
}
