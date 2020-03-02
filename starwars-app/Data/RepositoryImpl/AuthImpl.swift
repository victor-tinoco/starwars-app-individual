//
//  AuthImpl.swift
//  starwars-app
//
//  Created by Victor Martins Tinoco - VTN on 02/03/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

class AuthImpl: AuthRepository {
    private let _authService = AuthService()
    
    func makeLogin(email: String, password: String) -> Single<Void> {
        return _authService.makeLogin(email: email, password: password)
    }
    
    func makeLogout() -> Single<Bool> {
        return _authService.makeLogout()
    }
}
