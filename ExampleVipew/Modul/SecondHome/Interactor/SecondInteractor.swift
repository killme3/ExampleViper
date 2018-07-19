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

class SecondInteractor: DebugError ,SecondPresenterToInteractorProtocol {
    var presenter: SecondInteractorToPresenterProtocol?
    
    func fetchName() {        
        Alamofire.request(Constants.URL).responseJSON { response in
            switch response.result {
            case .success:
                do {
                    let commentResult = try JSONDecoder().decode(ContactResult.self, from: response.data!)
                    self.presenter?.secondFetchedName(name: commentResult)
                } catch let err {
                    print(err)
                }
            case .failure(let error):
                self.debug(error: error, statusCode: response.response?.statusCode as Any)
                self.presenter?.secondFetchedNameFailed(errorName: error.localizedDescription ,statusCode: response.response?.statusCode ?? 0)
            }
            self.presenter?.secondViewLoading()
        }
    }
    
    
}
