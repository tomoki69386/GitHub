//
//  UIImageView+GitHub.swift
//  GitHub
//
//  Created by 築山朋紀 on 2019/06/23.
//  Copyright © 2019 築山朋紀. All rights reserved.
//

import UIKit
import Nuke

extension UIImageView {
    func setImage(with string: String?) {
        guard let urlString = string else { return }
        guard let url = URL(string: urlString) else { return }
        Nuke.loadImage(with: url, into: self)
    }
}
