//
//  ViewController.swift
//  starwars-app
//
//  Created by Victor Martins Tinoco - VTN on 28/02/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class StartViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!

    private var _viewModel: StartViewModelProtocol?
    private var _DIProtocol: StartViewControllerDIProtocol?
    private var _disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    static func instantiate(viewModel: StartViewModelProtocol, DIProtocol: StartViewControllerDIProtocol) -> StartViewController? {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle(for: StartViewController.self))
        guard let vc = storyboard.instantiateViewController(withIdentifier: StartViewController.storyboardIdentifier) as? StartViewController else { return nil }
        vc._viewModel = viewModel
        vc._DIProtocol = DIProtocol
        return vc
    }
    
    func setup() {
        loginButton.layer.cornerRadius = 25
        titleLabel.text = _viewModel?.title
        subtitleLabel.text = _viewModel?.subtitle
        
        loginButton.rx.tap.bind { _ in
            let vc = self._DIProtocol!.makeNextPage()
            self.navigationController?.pushViewController(vc, animated: true)
        }.disposed(by: _disposeBag)
    }
}

