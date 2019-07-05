//
//  ProfileViewController.swift
//  GitHub
//
//  Created by 築山朋紀 on 2019/06/17.
//  Copyright © 2019 築山朋紀. All rights reserved.
//

import UIKit
import PKHUD
import NSObject_Rx

class ProfileViewController: UITableViewController {
    
    @IBOutlet private weak var avatarImageView: ImageView!
    @IBOutlet private weak var usernameLabel: UILabel!
    @IBOutlet private weak var screenIdLabel: UILabel!
    @IBOutlet private weak var followersButton: UIButton!
    @IBOutlet private weak var followingButton: UIButton!
    
    private let viewModel = ProfileViewModel(model: ProfileModel())

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.errors.drive(onNext: { error in
            print(error)
        }).disposed(by: rx.disposeBag)
        
        viewModel.user.drive(onNext: { [weak self] user in
            self?.avatarImageView.setImage(with: user.avatarURL)
            self?.usernameLabel.text = user.name
            self?.screenIdLabel.text = user.screenId
            self?.followersButton.titleLabel?.text = "\(user.followers)Followers"
            self?.followingButton.titleLabel?.text = "\(user.following)Following"
        }).disposed(by: rx.disposeBag)
        
        followingButton.rx.tap.asDriver().drive(onNext: { [weak self] in
            guard let username = self?.screenIdLabel.text else { return }
            let target = FollowingViewController.make(username)
            self?.navigationController?.pushViewController(target, animated: true)
        }).disposed(by: rx.disposeBag)
        
        followersButton.rx.tap.asDriver().drive(onNext: { [weak self] in
            guard let username = self?.screenIdLabel.text else { return }
            let target = FollowersViewController.make(username: username)
            self?.navigationController?.pushViewController(target, animated: true)
        }).disposed(by: rx.disposeBag)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
