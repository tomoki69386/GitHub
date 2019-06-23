//
//  FollowersViewController.swift
//  GitHub
//
//  Created by 築山朋紀 on 2019/06/17.
//  Copyright © 2019 築山朋紀. All rights reserved.
//

import UIKit
import PKHUD

final class FollowersViewController: UITableViewController {
    
    fileprivate var viewModel: FollowersViewModel!
    private lazy var dataSource = FollowersDataSource(with: self.tableView, viewModel: self.viewModel)
    
    static func make(username: String) -> FollowersViewController {
        let vc = R.storyboard.followers.instantiateInitialViewController()!
        vc.viewModel = FollowersViewModel(username: username, model: FollowersModel())
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(BasicListTableViewCell.nib, forCellReuseIdentifier: BasicListTableViewCell.name)
        _ = dataSource
        navigationItem.title = "Followers"
        
        viewModel.reloadData.drive(onNext: { [weak self] in
            self?.tableView.reloadData()
        }).disposed(by: rx.disposeBag)
        
        viewModel.errors.drive(onNext: { error in
            HUD.flashMessage(.label(error.localizedDescription))
        }).disposed(by: rx.disposeBag)
    }
}
