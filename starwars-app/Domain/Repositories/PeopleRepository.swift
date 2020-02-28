//
//  PeopleRepository.swift
//  starwars-app
//
//  Created by Victor Martins Tinoco - VTN on 28/02/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol PeopleRepository {
    var people: Single<[People]> { get }
}
