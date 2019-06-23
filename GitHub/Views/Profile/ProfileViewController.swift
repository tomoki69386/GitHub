//
//  ProfileViewController.swift
//  GitHub
//
//  Created by 築山朋紀 on 2019/06/17.
//  Copyright © 2019 築山朋紀. All rights reserved.
//

import UIKit
import NSObject_Rx

class ProfileViewController: UITableViewController {
    
    private let viewModel = ProfileViewModel(model: ProfileModel())

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.errors.drive(onNext: { error in
            print(error)
        }).disposed(by: rx.disposeBag)
        
        viewModel.user.drive(onNext: { user in
            print(user)
        }).disposed(by: rx.disposeBag)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    @IBAction private func followersButtonDidTapped(sender: UIButton) {
    }
    
    @IBAction private func followingButtonDidTapped(sender: UIButton) {
        
    }
}
