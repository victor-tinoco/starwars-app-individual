//
//  aaa.swift
//  starwars-app
//
//  Created by Victor Martins Tinoco - VTN on 28/02/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    private var _viewModel: LoginViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    static func instantiate(viewModel: LoginViewModelProtocol) -> LoginViewController? {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle(for: LoginViewController.self))
        guard let vc = storyboard.instantiateViewController(withIdentifier: LoginViewController.storyboardIdentifier) as? LoginViewController else { return nil }
        vc._viewModel = viewModel
        return vc
    }
    
    func setup() {
        titleLabel.text = _viewModel?.title
        
        userTextField.layer.cornerRadius = 25
        userTextField.clipsToBounds = true
        
        passwordTextField.layer.cornerRadius = 20
        passwordTextField.clipsToBounds = true
        
        loginButton.layer.cornerRadius = 25
    }
}
