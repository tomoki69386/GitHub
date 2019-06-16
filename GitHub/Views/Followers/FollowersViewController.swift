//
//  FollowersViewController.swift
//  GitHub
//
//  Created by 築山朋紀 on 2019/06/17.
//  Copyright © 2019 築山朋紀. All rights reserved.
//

import UIKit

final class FollowersViewController: UITableViewController {
    
    private lazy var dataSource = FollowersDataSource(with: self.tableView)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(BasicListTableViewCell.nib, forCellReuseIdentifier: BasicListTableViewCell.name)
        _ = dataSource
        navigationItem.title = "Followers"
    }
}
