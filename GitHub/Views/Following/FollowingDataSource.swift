//
//  FollowingDataSource.swift
//  GitHub
//
//  Created by 築山朋紀 on 2019/06/23.
//  Copyright © 2019 築山朋紀. All rights reserved.
//

import UIKit

class FollowingDataSource: NSObject, UITableViewDataSource {
    convenience init(with tableView: UITableView) {
        self.init()
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: BasicListTableViewCell.name) as? BasicListTableViewCell else {
            fatalError("Invalid cell")
        }
        cell.update(url: "hog", body: "List")
        return cell
    }
}
