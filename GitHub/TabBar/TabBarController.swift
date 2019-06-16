//
//  TabBarController.swift
//  GitHub
//
//  Created by 築山朋紀 on 2019/06/17.
//  Copyright © 2019 築山朋紀. All rights reserved.
//

import UIKit

final class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let viewControllers = Tab.allCases.map { $0.instantiateViewController() }
        setViewControllers(viewControllers, animated: false)
    }
    
    enum Tab: CaseIterable {
        case timeline
        
        func instantiateViewController() -> UIViewController {
            let vc: UIViewController!
            let tabBarItem: UITabBarItem
            switch self {
            case .timeline:
                vc = UIViewController()
                tabBarItem = UITabBarItem(title: "タイムライン", image: UIImage(), tag: 0)
            }
            vc.tabBarItem = tabBarItem
            return vc
        }
    }
}
