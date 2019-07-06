//
//  FollowingDataSource.swift
//  GitHub
//
//  Created by 築山朋紀 on 2019/06/23.
//  Copyright © 2019 築山朋紀. All rights reserved.
//

import UIKit

protocol ViewModelProtocol {
    associatedtype Output
    func output(_ handler: ((Output) -> Void)?)
}

class FollowingDataSource: NSObject, UITableViewDataSource, UITableViewDelegate, ViewModelProtocol {
    typealias Output = ProfileViewController
    func output(_ handler: ((ProfileViewController) -> Void)?) {
        self.handler = handler
    }
    var handler: ((ProfileViewController) -> ())?

    private var viewModel: FollowingViewModel!
    convenience init(with tableView: UITableView, viewModel: FollowingViewModel) {
        self.init()
        tableView.dataSource = self
        tableView.delegate = self
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
        let user = viewModel.users[indexPath.row]
        let target = ProfileViewController.make(by: user.screenId)
        self.handler?(target)
    }
}
