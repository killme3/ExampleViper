//
//  SecondViewController.swift
//  ExampleVipew
//
//  Created by yana mulyana on 16/07/18.
//  Copyright © 2018 yana mulyana. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    var presenter: SecondViewToPresenterProtocol?
    var contactResult: ContactResult!
    fileprivate let dataSourceTableView = SecondDataSourceTableView()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.updateView()
    }

    @IBAction func dismissTapped(_ sender: Any) {
        presenter?.dismissView(nav: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

extension SecondViewController: SecondPresenterToViewProtocol {
    func showName(name: ContactResult) {
        self.contactResult = name
        self.dataSourceTableView.secondViewController = self
        self.dataSourceTableView.setupData()
    }
    
    func showError() {
        let alert = UIAlertController(title: "Alert", message: "Problem Fetching News", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}

