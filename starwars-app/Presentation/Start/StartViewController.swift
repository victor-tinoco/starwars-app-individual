//
//  ViewController.swift
//  starwars-app
//
//  Created by Victor Martins Tinoco - VTN on 28/02/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!

    private var _viewModel: StartViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    static func instantiate(viewModel: StartViewModelProtocol) -> StartViewController? {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle(for: StartViewController.self))
        guard let vc = storyboard.instantiateViewController(withIdentifier: StartViewController.storyboardIdentifier) as? StartViewController else { return nil }
        vc._viewModel = viewModel
        return vc
    }
    
    func setup() {
        loginButton.layer.cornerRadius = 25
        titleLabel.text = _viewModel?.title
        subtitleLabel.text = _viewModel?.subtitle
    }
}

