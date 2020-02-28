//
//  PeopleUseCase.swift
//  starwars-app
//
//  Created by Victor Martins Tinoco - VTN on 28/02/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol PeopleUseCaseContract {
    var peoples: Single<[People]> { get }
}

class PeopleUseCase: PeopleUseCaseContract {
    private var _peopleRepos: PeopleRepository
    
    init(peopleRepository: PeopleRepository) {
        self._peopleRepos = peopleRepository
    }
    
    var peoples: Single<[People]> {
        return _peopleRepos.people
    }
}
