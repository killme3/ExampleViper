//
//  SecondViewController.swift
//  ExampleVipew
//
//  Created by yana mulyana on 16/07/18.
//  Copyright © 2018 yana mulyana. All rights reserved.
//

import UIKit
import PKHUD

class SecondViewController: BaseClass {

    var presenter: SecondViewToPresenterProtocol?
    var contactResult: ContactResult!
    fileprivate let dataSourceTableView = SecondDataSourceTableView()
    @IBOutlet weak var emptyView: EmptyView!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if Connectivity.isConnectedToInternet() {
            HUD.show(.progress, onView: self.view)
            presenter?.updateView()
        } else {
            showEmptyView(emptyView: emptyView)
        }
    }
    
    @IBAction func dismissTapped(_ sender: Any) {
        presenter?.dismissView(nav: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

extension SecondViewController: SecondPresenterToViewProtocol {
    func hideHud() {
        HUD.hide()
    }
    
    func showName(name: ContactResult) {
        contactResult = name
        dataSourceTableView.secondViewController = self
        dataSourceTableView.setupData()
    }
    
    func showError(errorName: String ,statusCode: Int) {
        showEmptyView(emptyView: emptyView)
        showAlert(errorName: errorName, statusCode: statusCode)
    }
    
}

