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
        callAPI()
        self.emptyView.btnRetry.addTarget(self, action: #selector(SecondViewController.btnRetryTapped(sender:)), for: .touchUpInside)
    }
    
    @IBAction func dismissTapped(_ sender: Any) {
        presenter?.dismissView(nav: self)
    }
    
    func callAPI() {
        if Connectivity.isConnectedToInternet() {
            hideEmptyView(emptyView: emptyView)
            HUD.show(.progress, onView: self.view)
            presenter?.updateView()
        } else {
            emptyView.lblEmptyView.text = StringError.NO_INTERNET.rawValue
            showEmptyView(errorName: StringError.NO_INTERNET.rawValue, emptyView: emptyView)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @objc func btnRetryTapped(sender: UIButton) {
        callAPI()
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
        showEmptyView(errorName: StringError.NO_INTERNET.rawValue, emptyView: emptyView)
        showAlert(errorName: errorName, statusCode: statusCode)
    }
    
}

