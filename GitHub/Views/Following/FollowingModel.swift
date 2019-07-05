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
    func searchUser(by query: String, users: [SummaryUserInformation]) -> Observable<[SummaryUserInformation]>
}

final class FollowingModel: FollowingModelProtocol {
    let userInfoProvider = UserInfoProvider()
    func getFollowingUsers(of name: String) -> Single<[SummaryUserInformation]> {
        return userInfoProvider.getFollowingUsers(of: name)
    }
    
    func searchUser(by query: String, users: [SummaryUserInformation]) -> Observable<[SummaryUserInformation]> {
        return Observable.create { observable in
            var _users = [SummaryUserInformation]()
            users.forEach {
                if $0.screenId.search(by: query) {
                    _users.append($0)
                }
            }
            observable.onNext(_users)
            observable.onCompleted()
            return Disposables.create()
        }
    }
}
