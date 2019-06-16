//
//  FollowersDataSource.swift
//  GitHub
//
//  Created by 築山朋紀 on 2019/06/17.
//  Copyright © 2019 築山朋紀. All rights reserved.
//

import UIKit

class FollowersDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    convenience init(with tableView: UITableView) {
        self.init()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: BasicListTableViewCell.name) as? BasicListTableViewCell else {
            fatalError("Invalid cell")
        }
        cell.update(url: "hog", body: "List")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}
