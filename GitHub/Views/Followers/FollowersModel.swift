//
//  FollowersModel.swift
//  GitHub
//
//  Created by 築山朋紀 on 2019/06/23.
//  Copyright © 2019 築山朋紀. All rights reserved.
//

import RxSwift
import RxCocoa

protocol FollowersModelProtocol {
    func getFollowerUsers(of name: String) -> Single<[SummaryUserInformation]>
}

final class FollowersModel: FollowersModelProtocol {
    let userInfoProvider = UserInfoProvider()
    func getFollowerUsers(of name: String) -> Single<[SummaryUserInformation]> {
        return userInfoProvider.getFollowerUsers(of: name)
    }
}
