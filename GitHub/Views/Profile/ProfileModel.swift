//
//  ProfileModel.swift
//  GitHub
//
//  Created by 築山朋紀 on 2019/06/17.
//  Copyright © 2019 築山朋紀. All rights reserved.
//

import RxSwift
import RxCocoa

protocol ProfileModelProtocol {
    func getLoginUser() -> Single<UserInformation>
}

final class ProfileModel: ProfileModelProtocol {
    let userInfoProvider = UserInfoProvider()
    
    func getLoginUser() -> Single<UserInformation> {
        return userInfoProvider.getLoginUser()
    }
}
