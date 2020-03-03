//
//  aaa.swift
//  starwars-app
//
//  Created by Victor Martins Tinoco - VTN on 28/02/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class LoginViewController: UIViewController {
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    private var _DIProtocol: LoginViewControllerDIProtocol?
    private var _viewModel: LoginViewModelContract?
    private let _disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        bind()
    }
    
    static func instantiate(viewModel: LoginViewModelContract, DIProtocol: LoginViewControllerDIProtocol) -> LoginViewController? {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle(for: LoginViewController.self))
        guard let vc = storyboard.instantiateViewController(withIdentifier: LoginViewController.storyboardIdentifier) as? LoginViewController else { return nil }
        vc._viewModel = viewModel
        vc._DIProtocol = DIProtocol
        return vc
    }
    
    func setup() {
        titleLabel.text = _viewModel?.title
        
        userTextField.layer.cornerRadius = 25
        userTextField.layer.borderWidth = 1.0
        userTextField.layer.borderColor = UIColor.lightGray.cgColor
        userTextField.layer.masksToBounds = true
        userTextField.placeholder = _viewModel?.placeholderLogin
        
        passwordTextField.layer.cornerRadius = 25
        passwordTextField.layer.borderWidth = 1.0
        passwordTextField.layer.borderColor = UIColor.lightGray.cgColor
        passwordTextField.layer.masksToBounds = true
        passwordTextField.placeholder = _viewModel?.placeholderPass
        
        loginButton.layer.cornerRadius = 25
    }
    
    func bind() {
        backButton.rx.tap.bind { _ in
            self.navigationController?.popViewController(animated: true)
        }.disposed(by: _disposeBag)
        
        loginButton.rx.tap.bind { _ in
            guard let user = self.userTextField.text, !user.isEmpty, let pass = self.passwordTextField.text, !pass.isEmpty else {
                print("Preencha os campos corretamente!")
                return
            }
            self._viewModel?.makeLogin(email: user, password: pass)
            self.loginButton.isEnabled = false
        }.disposed(by: _disposeBag)
        
        self._viewModel?.loginResultState.drive(onNext: { (state) in
            switch (state) {
            case .success:
                guard let vc = self._DIProtocol?.didLoginSuccess() else { return }
                UIApplication.shared.keyWindow?.rootViewController =  UINavigationController(rootViewController: vc)
            case .noInternet: break
                
            case .accessDenied: break
                
            }
            self.loginButton.isEnabled = true
        }).disposed(by: self._disposeBag)
    }
}
