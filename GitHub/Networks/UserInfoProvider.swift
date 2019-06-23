//
//  UserInfoProvider.swift
//  GitHub
//
//  Created by 築山朋紀 on 2019/06/23.
//  Copyright © 2019 築山朋紀. All rights reserved.
//

import Moya
import RxMoya
import RxSwift
import RxCocoa

class UserInfoProvider: BaseProvider {
    func request(_ token: GithubAPI) -> Single<Moya.Response> {
        return super.rx
            .request(token)
            .observeOn(ConcurrentDispatchQueueScheduler(qos: .utility))
    }
    
    func getLoginUser() -> Single<String> {
        return self.request(.getMe)
        .filterSuccessfulStatusCodes()
            .map { response in
                let decoder = JSONDecoder()
        }
    }
}
