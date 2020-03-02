//
//  AuthUseCase.swift
//  starwars-app
//
//  Created by Victor Martins Tinoco - VTN on 02/03/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol AuthUseCaseContract {
    func makeLogin(email: String, password: String) -> Single<Void>
    func makeLogout() -> Single<Bool>
}

class AuthUseCase: AuthUseCaseContract {
    private var _authRepos: AuthRepository
    
    init(authRepository: AuthRepository) {
        self._authRepos = authRepository
    }
    
    func makeLogin(email: String, password: String) -> Single<Void> {
        return _authRepos.makeLogin(email: email, password: password)
    }
    
    func makeLogout() -> Single<Bool> {
        return _authRepos.makeLogout()
    }
}
