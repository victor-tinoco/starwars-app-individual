//
//  PeopleService.swift
//  starwars-app
//
//  Created by Victor Martins Tinoco - VTN on 28/02/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import Foundation

class PeopleService: MoyaService {
    override var baseURL: URL {
        return URL(string: "http://mock.iteris.local:8888/")!
    }
    
    override var path: String {
        return "people/"
    }
}
