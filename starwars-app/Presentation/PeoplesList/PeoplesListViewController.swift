//
//  PeoplesListViewController.swift
//  starwars-app
//
//  Created by Victor Martins Tinoco - VTN on 03/03/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class PeoplesListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    private var _viewModel: PeoplesListViewModelContract?
    private var _DIProtocol: PeoplesListViewControllerDIProtocol?
    private let _disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _viewModel?.requirePeoples()
        bind()
    }
    
    static func instantiate(viewModel: PeoplesListViewModelContract, DIProtocol: PeoplesListViewControllerDIProtocol) -> PeoplesListViewController? {
        let storyboard = UIStoryboard(name: "People", bundle: Bundle(for: PeoplesListViewController.self))
        guard let vc = storyboard.instantiateViewController(withIdentifier: PeoplesListViewController.storyboardIdentifier) as? PeoplesListViewController else { return nil }
        vc._viewModel = viewModel
        vc._DIProtocol = DIProtocol
        return vc
    }
    
    func bind() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        _viewModel?.peoples.drive(tableView.rx.items(cellIdentifier: "cell")) {
            index, model, cell in
            cell.textLabel?.text = model.name
        }.disposed(by: _disposeBag)
        
        tableView.rx.itemSelected.bind { indexPath in
            guard let people = self._viewModel?.getPeople(index: indexPath.row) else { return }
            let vc = self._DIProtocol!.makeDetailsPage(people: people)
            self.navigationController?.pushViewController(vc, animated: true)
        }.disposed(by: _disposeBag)
    }
}
