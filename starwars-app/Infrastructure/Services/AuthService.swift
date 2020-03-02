//
//  AuthService.swift
//  starwars-app
//
//  Created by Victor Martins Tinoco - VTN on 02/03/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import RxCocoa
import RxSwift
import Foundation
import FirebaseAuth

class AuthService {
    func makeLogin(email: String, password: String) -> Single<Void> {
        return Single<Void>.create { (single) -> Disposable in
            Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
                if let error = error {
                    print(error.localizedDescription)
                    print("Erro ao fazer Login -> Infrastructure/Services/AuthService.swift")
                    
                    single(.error(error))
                }
                else if let user = user?.user {
                    print(user.uid)
                    
                    single(.success(()))
                }
            }
            return Disposables.create()
        }
    }
    
    func makeLogout() -> Single<Bool> {
//      Por ser uma aplicação que tem por fim estudo iremos retornar nessa função um single de Bool indicando se deu sucesso ou erro na action Logout, mas o correto seria a criação de um tipo de erro e um retorno de Single<Result<Void, Error>> (algo nesse sentido)!
        return Single.create { (single) -> Disposable in
            if Auth.auth().currentUser != nil {
                do {
                    try Auth.auth().signOut()
                    single(.success(true))
                }
                catch {
                    print("Erro ao fazer Logout -> Infrastructure/Services/AuthService.swift")
                    single(.success(false))
                }
            }
            return Disposables.create()
        }
    }
}
