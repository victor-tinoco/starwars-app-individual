//
//  PeopleDetailsViewModel.swift
//  starwars-app
//
//  Created by Victor Martins Tinoco - VTN on 03/03/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol PeopleDetailsViewModelContract {
    var name: String { get }
}

class PeopleDetailsViewModel: PeopleDetailsViewModelContract {
    private var _people: People
    
    var name: String { return _people.name }
    
    init(people: People) {
        self._people = people
    }
}
