//
//  PeoplesListDIContainer.swift
//  starwars-app
//
//  Created by Victor Martins Tinoco - VTN on 03/03/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import UIKit

protocol PeoplesListViewControllerDIProtocol {
    func makeDetailsPage(people: People) -> UIViewController
}

extension AppDIContainer: PeoplesListViewControllerDIProtocol {
    func makeDetailsPage(people: People) -> UIViewController {
        let vm = PeopleDetailsViewModel(people: people)
        return PeopleDetailsViewController.instantiate(viewModel: vm)!
    }
}
