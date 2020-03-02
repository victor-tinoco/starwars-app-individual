//
//  AuthRepository.swift
//  starwars-app
//
//  Created by Victor Martins Tinoco - VTN on 02/03/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol AuthRepository {
    func makeLogin(email: String, password: String) -> Single<Void>
    func makeLogout() -> Single<Bool>
}
