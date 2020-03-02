//
//  StartViewModel.swift
//  starwars-app
//
//  Created by Victor Martins Tinoco - VTN on 28/02/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol StartViewModelProtocol {
    var title: String { get }
    var subtitle: String { get }
}

class StartViewModel: StartViewModelProtocol {    
    var title: String {
        return "Bem vindo!"
    }
    
    var subtitle: String {
        return "É bom te ver novamente."
    }
}

