//
//  FollowingViewController.swift
//  GitHub
//
//  Created by 築山朋紀 on 2019/06/17.
//  Copyright © 2019 築山朋紀. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import PKHUD

class FollowingViewController: UITableViewController {
    
    @IBOutlet private weak var searchBar: UISearchBar!
    
    fileprivate var viewModel: FollowingViewModel!
    private lazy var dataSource = FollowingDataSource(with: self.tableView, viewModel: self.viewModel)
    
    static func make(_ username: String) -> FollowingViewController {
        let vc = R.storyboard.following.instantiateInitialViewController()!
        vc.viewModel = FollowingViewModel(username: username, model: FollowingModel())
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(BasicListTableViewCell.nib, forCellReuseIdentifier: BasicListTableViewCell.name)
        _ = dataSource
        navigationItem.title = "Following"
        
        dataSource.output { [weak self] target in
            self?.navigationController?.pushViewController(target, animated: true)
        }
        
        searchBar.rx.text.orEmpty.bind(to: viewModel.query).disposed(by: rx.disposeBag)
        
        viewModel.errors.drive(onNext: { error in
            HUD.flashMessage(.label(error.localizedDescription))
        }).disposed(by: rx.disposeBag)
        
        viewModel.reloadData.drive(onNext: { [weak self] in
            self?.tableView.reloadData()
        }).disposed(by: rx.disposeBag)
    }
}
