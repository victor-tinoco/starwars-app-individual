//
//  AppDIContainer.swift
//  starwars-app
//
//  Created by Victor Martins Tinoco - VTN on 28/02/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import UIKit

class AppDIContainer {
    func makeStartViewController() -> StartViewController {
        let vm = StartViewModel()
        return StartViewController.instantiate(viewModel: vm, DIProtocol: self)!
    }
}
