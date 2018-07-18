//
//  DetailHomeViewController.swift
//  ExampleVipew
//
//  Created by yana mulyana on 17/07/18.
//  Copyright © 2018 yana mulyana. All rights reserved.
//

import UIKit

class DetailHomeViewController: UIViewController {

    @IBOutlet weak var labelEmail: UILabel!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelAddress: UILabel!
    
    var presenter: DetailViewToPresenterProtocol?
    var item: Contact!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.getData(data: item)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

extension DetailHomeViewController: DetailPresenterToViewProtocol {
    func setData(item: Contact) {
        labelName.text = item.name
        labelEmail.text = item.email
        labelAddress.text = item.address
    }
    
}
