//
//  FollowingViewController.swift
//  GitHub
//
//  Created by 築山朋紀 on 2019/06/17.
//  Copyright © 2019 築山朋紀. All rights reserved.
//

import UIKit
import PKHUD

class FollowingViewController: UITableViewController {
    
    fileprivate var viewModel: FollowingViewModel!
    private lazy var dataSource = FollowingDataSource(with: self.tableView, viewModel: self.viewModel)
    
    static func make(_ username: String) -> FollowingViewController {
        let vc = R.storyboard.following.instantiateInitialViewController()!
        vc.viewModel = FollowingViewModel(username: username, model: FollowingModel())
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _ = dataSource
        navigationItem.title = "Following"
        
        viewModel.errors.drive(onNext: { error in
            HUD.flashMessage(.label(error.localizedDescription))
        }).disposed(by: rx.disposeBag)
    }
}
