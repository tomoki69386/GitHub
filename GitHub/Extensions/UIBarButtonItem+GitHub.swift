//
//  UIBarButtonItem+GitHub.swift
//  GitHub
//
//  Created by 築山朋紀 on 2019/06/17.
//  Copyright © 2019 築山朋紀. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    class func createBackBarButtonItemForEmptyTitle() -> UIBarButtonItem {
        let backBarButtonItem = UIBarButtonItem()
        backBarButtonItem.title = " "
        return backBarButtonItem
    }
}
