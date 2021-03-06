//
//  BasicListTableViewCell.swift
//  GitHub
//
//  Created by 築山朋紀 on 2019/06/17.
//  Copyright © 2019 築山朋紀. All rights reserved.
//

import UIKit

final class BasicListTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var iconImageView: ImageView!
    @IBOutlet private weak var bodyLabel: UILabel!
    
    func update(url: String?, body: String) {
        bodyLabel.text = body
        iconImageView.setImage(with: url)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
