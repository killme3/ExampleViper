//
//  SecondInteractor.swift
//  ExampleVipew
//
//  Created by yana mulyana on 16/07/18.
//  Copyright © 2018 yana mulyana. All rights reserved.
//

import Foundation
import Alamofire
import PKHUD

class SecondInteractor: SecondPresenterToInteractorProtocol {
    var presenter: SecondInteractorToPresenterProtocol?
    
    func fetchName() {
        HUD.show(.progress)
        Alamofire.request(Constants.URL).responseJSON { response in
            HUD.hide()
            if(response.response?.statusCode == 200){
                do {
                    let result = try JSONDecoder().decode(ContactResult.self, from: response.data!)
                    self.presenter?.secondFetchedName(name: result)
                } catch let err {
                    print(err)
                }
            }
            else {
                self.presenter?.secondFetchedNameFailed()
            }
        }
    }
    
    
}
