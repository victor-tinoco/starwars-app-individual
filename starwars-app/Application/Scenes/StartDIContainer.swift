//
//  StartDIContainer.swift
//  starwars-app
//
//  Created by Victor Martins Tinoco - VTN on 02/03/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import UIKit

protocol StartViewControllerDIProtocol {
    func makeNextPage() -> UIViewController
}

extension AppDIContainer: StartViewControllerDIProtocol {
    func makeNextPage() -> UIViewController {
        let vm = LoginViewModel(authUseCase: AuthUseCase(authRepository: AuthImpl()))
        return LoginViewController.instantiate(viewModel: vm)!
    }
}
