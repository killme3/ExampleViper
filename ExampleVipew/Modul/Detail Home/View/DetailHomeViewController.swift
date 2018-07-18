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
    
    var item: Contact?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.labelName.text = self.item?.name
        self.labelEmail.text = self.item?.email
        self.labelAddress.text = self.item?.address
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
