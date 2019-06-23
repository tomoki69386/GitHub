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

protocol UserInfoProviderProtocol {
    func getLoginUser() -> Single<UserInformation>
    func getFollowingUsers(of name: String) -> Single<[UserInformation]>
}

class UserInfoProvider: BaseProvider, UserInfoProviderProtocol {
    func request(_ token: GithubAPI) -> Single<Moya.Response> {
        return super.rx
            .request(token)
            .observeOn(ConcurrentDispatchQueueScheduler(qos: .utility))
    }
    
    func getLoginUser() -> Single<UserInformation> {
        return self.request(.getMe)
            .filterSuccessfulStatusCodes()
            .map { response in
                let decoder = JSONDecoder()
                let decodedData: UserInformation
                
                do {
                    decodedData = try decoder.decode(UserInformation.self, from: response.data)
                } catch let error as DecodingError {
                    throw error
                }
                return decodedData
        }
    }
    
    func getFollowingUsers(of name: String) -> Single<[UserInformation]> {
        return self.request(.following(name: name))
            .filterSuccessfulStatusCodes()
            .map { response in
                let decoder = JSONDecoder()
                let decodedData: [UserInformation]
                
                do {
                    decodedData = try decoder.decode([UserInformation].self, from: response.data)
                } catch let error as DecodingError {
                    throw error
                }
                return decodedData
        }
    }
}
