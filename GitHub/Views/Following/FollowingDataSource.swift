//
//  FollowingDataSource.swift
//  GitHub
//
//  Created by 築山朋紀 on 2019/06/23.
//  Copyright © 2019 築山朋紀. All rights reserved.
//

import UIKit

class FollowingDataSource: NSObject, UITableViewDataSource {
    private var viewModel: FollowingViewModel!
    convenience init(with tableView: UITableView, viewModel: FollowingViewModel) {
        self.init()
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
}
