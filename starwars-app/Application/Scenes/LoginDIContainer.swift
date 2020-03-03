//
//  LoginDIContainer.swift
//  
//
//  Created by Victor Martins Tinoco - VTN on 03/03/20.
//

import UIKit

protocol LoginViewControllerDIProtocol {
    func didLoginSuccess() -> UIViewController
}

extension AppDIContainer: LoginViewControllerDIProtocol {
    func didLoginSuccess() -> UIViewController {
        let vm = PeoplesListViewModel()
        return PeoplesListViewController.instantiate(viewModel: vm)!
    }
}
