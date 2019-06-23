//
//  FollowersDataSource.swift
//  GitHub
//
//  Created by 築山朋紀 on 2019/06/17.
//  Copyright © 2019 築山朋紀. All rights reserved.
//

import UIKit

class FollowersDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    var viewModel: FollowersViewModel!
    convenience init(with tableView: UITableView, viewModel: FollowersViewModel) {
        self.init()
        tableView.delegate = self
        tableView.dataSource = self
        self.viewModel = viewModel
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: BasicListTableViewCell.name) as? BasicListTableViewCell else {
            fatalError("Invalid cell")
        }
        let user = viewModel.users[indexPath.row]
        cell.update(url: user.avatarURL, body: user.screenId)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}
