//
//  Connectivity.swift
//  starwars-app
//
//  Created by Victor Martins Tinoco - VTN on 02/03/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import Foundation
import Alamofire

class Connectivity {
    class var isConnectedToInternet:Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
    }
}
