//
//  AppDIContainer.swift
//  starwars-app
//
//  Created by Victor Martins Tinoco - VTN on 28/02/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import UIKit

class AppDIContainer {
    static func makeStartViewController() -> StartViewController {
        let vm = StartViewModel()
        return StartViewController.instantiate(viewModel: vm)!
    }
    
    static func makeLoginViewController() -> LoginViewController {
        let vm = LoginViewModel()
        return LoginViewController.instantiate(viewModel: vm)!
    }
}
