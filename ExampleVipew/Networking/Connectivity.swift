//
//  Connectivity.swift
//  ExampleVipew
//
//  Created by yana mulyana on 19/07/18.
//  Copyright © 2018 yana mulyana. All rights reserved.
//

import Foundation
import Alamofire

class Connectivity {
    class func isConnectedToInternet() ->Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}
