//
//  ProfileViewModel.swift
//  GitHub
//
//  Created by 築山朋紀 on 2019/06/17.
//  Copyright © 2019 築山朋紀. All rights reserved.
//

import RxSwift
import RxCocoa

class ProfileViewModel {
    
    var user: Driver<UserInformation> = .empty()
    
    private let _errors = PublishSubject<Error>()
    var errors: Driver<Error> {
        return _errors.asDriver(onErrorDriveWith: .empty())
    }
    
    init(model: ProfileModelProtocol) {
        
        user = Observable
            .of(Observable.just(()))
            .merge()
            .flatMap { _ -> Observable<UserInformation> in
                
                return model.getLoginUser()
                    .asObservable()
                    .catchError { [weak self] error in
                        self?._errors.onNext(error)
                        return .empty()
                }
            }
            .asDriver(onErrorDriveWith: .empty())
    }
}
