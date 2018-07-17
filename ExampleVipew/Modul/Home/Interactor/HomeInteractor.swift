//
//  HomeInteractor.swift
//  ExampleVipew
//
//  Created by yana mulyana on 23/05/18.
//  Copyright © 2018 yana mulyana. All rights reserved.
//

import Foundation
import Alamofire

class HomeInteractor: HomePresenterToInteractorProtocol {
    var presenter: HomeInteractorToPresenterProtocol?
    
    func fetchHome() {
        Alamofire.request(Constants.URL).responseJSON { response in
            
            if(response.response?.statusCode == 200){
                do {
                    let commentResult = try JSONDecoder().decode(ContactResult.self, from: response.data!)
                    self.presenter?.homeFetched(news: commentResult)
                } catch let err {
                    print(err)
                }
            }
            else {
                self.presenter?.homeFetchedFailed()
            }
        }
    }
    
}
