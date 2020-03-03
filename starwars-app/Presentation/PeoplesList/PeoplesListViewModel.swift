//
//  PeoplesListViewModel.swift
//  starwars-app
//
//  Created by Victor Martins Tinoco - VTN on 03/03/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

protocol PeoplesListViewModelContract {
    var peoples: Driver<[People]> { get }
    func requirePeoples()
    func getPeople(index: Int) -> People
}

class PeoplesListViewModel: PeoplesListViewModelContract {
    private let _disposeBag = DisposeBag()
    private var _useCase: PeopleUseCaseContract
    private var _peoplesRelay: BehaviorRelay<[People]> = BehaviorRelay(value: [])
    
    var peoples: Driver<[People]> { return _peoplesRelay.asDriver() }
    
    init(useCase: PeopleUseCaseContract) {
        _useCase = useCase
    }
    
    func requirePeoples() {
        _useCase.peoples.subscribe(onSuccess: { (list) in
            self._peoplesRelay.accept(list)
        }).disposed(by: _disposeBag)
    }
    
    func getPeople(index: Int) -> People {
        return _peoplesRelay.value[index]
    }
}
