//
//  FollowersViewModel.swift
//  GitHub
//
//  Created by 築山朋紀 on 2019/06/23.
//  Copyright © 2019 築山朋紀. All rights reserved.
//

import RxSwift
import RxCocoa

final class FollowersViewModel {
    let disposeBag = DisposeBag()
    
    private let _users = BehaviorRelay<[SummaryUserInformation]>(value: [])
    var users: [SummaryUserInformation] { return _users.value }
    
    private let _errors = PublishSubject<Error>()
    var errors: Driver<Error> {
        return _errors.asDriver(onErrorDriveWith: .empty())
    }
    
    init(username: String,
         model: FollowersModelProtocol) {
        
        Observable
            .of(Observable.just(()))
            .merge()
            .flatMap { _ -> Observable<[SummaryUserInformation]> in
                return model.getFollowerUsers(of: username)
                    .asObservable()
                    .catchError { [weak self] error in
                        self?._errors.onNext(error)
                        return .empty()
                }
            }.subscribe(onNext: { [weak self] response in
                self?._users.accept(response)
            })
            .disposed(by: disposeBag)
    }
}
