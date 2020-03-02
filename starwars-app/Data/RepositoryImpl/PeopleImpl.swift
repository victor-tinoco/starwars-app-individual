//
//  PeopleImpl.swift
//  starwars-app
//
//  Created by Victor Martins Tinoco - VTN on 28/02/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

class PeopleImpl: PeopleRepository {
    private let _peopleService = PeopleService()
    
    var people: Single<[People]> {
        let peopleList: Single<BaseAPIResponse> = _peopleService.getDecodedResponse()
        return peopleList.map { (base) in
            return base.mapToPeople()
        }
    }
}
