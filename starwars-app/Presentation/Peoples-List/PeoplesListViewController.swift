//
//  PeoplesListViewController.swift
//  starwars-app
//
//  Created by Victor Martins Tinoco - VTN on 03/03/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import UIKit

class PeoplesListViewController: UIViewController {

    private var _viewModel: PeoplesListViewModelContract?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    static func instantiate(viewModel: PeoplesListViewModelContract) -> PeoplesListViewController? {
        let storyboard = UIStoryboard(name: "People", bundle: Bundle(for: PeoplesListViewController.self))
        guard let vc = storyboard.instantiateViewController(withIdentifier: PeoplesListViewController.storyboardIdentifier) as? PeoplesListViewController else { return nil }
        vc._viewModel = viewModel
        return vc
    }
}
