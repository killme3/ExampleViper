//
//  SecondDataSourceTableView.swift
//  ExampleVipew
//
//  Created by yana mulyana on 17/07/18.
//  Copyright © 2018 yana mulyana. All rights reserved.
//

import Foundation
import UIKit

class SecondDataSourceTableView: NSObject {
    
    var secondViewController: SecondViewController!
    
    func setupData() {
        self.secondViewController.tableView.delegate = self
        self.secondViewController.tableView.dataSource = self
        self.secondViewController.tableView.reloadData()
    }
    
}

extension SecondDataSourceTableView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.secondViewController.contactResult.contact.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath) as? SecondHomeTableViewCell {
            cell.item = self.secondViewController.contactResult.contact[indexPath.row]
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.secondViewController.presenter?.gotoDetail(nav: self.secondViewController, contactResult: self.secondViewController.contactResult.contact[indexPath.row])
    }
}
