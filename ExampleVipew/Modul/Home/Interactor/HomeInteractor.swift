//
//  HomeInteractor.swift
//  ExampleVipew
//
//  Created by yana mulyana on 23/05/18.
//  Copyright © 2018 yana mulyana. All rights reserved.
//

import Foundation
import Alamofire

class HomeInteractor: DebugError ,HomePresenterToInteractorProtocol {
    var presenter: HomeInteractorToPresenterProtocol?
    
    func fetchHome() {        
        Alamofire.request(Constants.URL).responseJSON { response in
            switch response.result {
                case .success:
                    do {
                        let commentResult = try JSONDecoder().decode(ContactResult.self, from: response.data!)
                        self.presenter?.homeFetched(news: commentResult)
                    } catch let err {
                        print(err)
                }
                case .failure(let error):
                    self.debug(error: error, statusCode: response.response?.statusCode as Any)
                    self.presenter?.homeFetchedFailed(errorName: error.localizedDescription, statusCode: response.response?.statusCode ?? 0)
            }
            self.presenter?.homeViewLoading()
        }
    }
    
}
