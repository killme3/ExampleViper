//
//  EmptyView.swift
//  ExampleVipew
//
//  Created by yana mulyana on 19/07/18.
//  Copyright © 2018 yana mulyana. All rights reserved.
//

import UIKit

class EmptyView: UIView {

    @IBOutlet weak var lblEmptyView: UILabel!
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var btnRetry: UIButton!
    let nibName = "EmptyView"
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        guard let viewChild = loadViewFromNib() else { return }
        viewChild.frame = self.bounds
        self.addSubview(viewChild)
        view = viewChild
    }

    func loadViewFromNib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    

}
