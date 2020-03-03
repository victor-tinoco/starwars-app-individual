//
//  LoginViewModel.swift
//  starwars-app
//
//  Created by Victor Martins Tinoco - VTN on 28/02/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

enum loginResultStates {
    case success
    case accessDenied
    case noInternet
}

protocol LoginViewModelContract {
    var loginResultState: Driver<loginResultStates> { get }
    
    var title: String { get }
    var placeholderLogin: String { get }
    var placeholderPass: String { get }
    
    func makeLogin(email: String, password: String)
}

class LoginViewModel: LoginViewModelContract {
    private let _disposeBag = DisposeBag()
    private var _authUseCase: AuthUseCaseContract
    private var _loginResultStateRelay: PublishRelay<loginResultStates> = PublishRelay()
    
    var title: String { return "Star Wars" }
    var placeholderLogin: String { return "Digite seu usuário" }
    var placeholderPass: String { return "Digite sua senha" }
    
    var loginResultState: Driver<loginResultStates> { return _loginResultStateRelay.asDriver(onErrorJustReturn: .accessDenied) }
    
    init(authUseCase: AuthUseCaseContract) {
        _authUseCase = authUseCase
    }

    func makeLogin(email: String, password: String) {
        _authUseCase.makeLogin(email: email, password: password).subscribe(onSuccess: {
            self._loginResultStateRelay.accept(.success)
        }) { (err) in
            let error = Connectivity.isConnectedToInternet ? loginResultStates.accessDenied : loginResultStates.noInternet
            self._loginResultStateRelay.accept(error)
        }.disposed(by: _disposeBag)
    }
}
