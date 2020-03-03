//
//  PeopleDetailsViewController.swift
//  starwars-app
//
//  Created by Victor Martins Tinoco - VTN on 03/03/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class PeopleDetailsViewController: UIViewController {

    var _viewModel: PeopleDetailsViewModelContract?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("HERE \(_viewModel?.name ?? "")")
    }
    
    static func instantiate(viewModel: PeopleDetailsViewModelContract) -> PeopleDetailsViewController? {
        let sb = UIStoryboard(name: "People", bundle: Bundle(for: PeopleDetailsViewController.self))
        guard let vc = sb.instantiateViewController(withIdentifier: PeopleDetailsViewController.storyboardIdentifier) as? PeopleDetailsViewController else { return nil }
        vc._viewModel = viewModel
        return vc
    }
    
}
