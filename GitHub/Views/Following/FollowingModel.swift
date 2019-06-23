//
//  FollowingModel.swift
//  GitHub
//
//  Created by 築山朋紀 on 2019/06/23.
//  Copyright © 2019 築山朋紀. All rights reserved.
//

import RxSwift
import RxCocoa

protocol FollowingModelProtocol {
    func getFollowingUsers(of name: String) -> Single<[SummaryUserInformation]>
}

final class FollowingModel: FollowingModelProtocol {
    let userInfoProvider = UserInfoProvider()
    func getFollowingUsers(of name: String) -> Single<[SummaryUserInformation]> {
        return userInfoProvider.getFollowingUsers(of: name)
    }
}
