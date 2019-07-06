//
//  FollowingViewModel.swift
//  GitHub
//
//  Created by 築山朋紀 on 2019/06/23.
//  Copyright © 2019 築山朋紀. All rights reserved.
//

import RxSwift
import RxCocoa

class FollowingViewModel {
    
    private let disposeBag = DisposeBag()
    
    private var preusers: [SummaryUserInformation] = []
    private let _users = BehaviorRelay<[SummaryUserInformation]>(value: [])
    var users: [SummaryUserInformation] { return _users.value }
    
    private let _errors = PublishSubject<Error>()
    var errors: Driver<Error> {
        return _errors.asDriver(onErrorDriveWith: .empty())
    }
    
    var reloadData: Driver<Void> = .empty()
    var query = Variable<String>("")
    
    init(username: String,
         model: FollowingModelProtocol) {
        
        self.reloadData = _users
            .map { _ in }
            .asDriver(onErrorDriveWith: .empty())
        
        Observable
            .of(Observable.just(()))
            .merge()
            .flatMap { _ -> Observable<[SummaryUserInformation]> in
                return model.getFollowingUsers(of: username)
                    .asObservable()
                    .catchError { [weak self] error in
                        self?._errors.onNext(error)
                        return .empty()
                }
            }.subscribe(onNext: { [weak self] response in
                self?._users.accept(response)
                self?.preusers = response
            })
            .disposed(by: disposeBag)
        
        Observable
            .of(query.asObservable())
            .merge()
            .map { _ in }
            .flatMapFirst { [weak self] _ -> Observable<[SummaryUserInformation]> in
                guard let me = self else { return .empty() }
                if me.query.value.isEmpty {
                    me._users.accept(me.preusers)
                    return .empty()
                }
                return model.searchUser(by: me.query.value, users: me.preusers)
            }.bind(to: _users)
            .disposed(by: disposeBag)
    }
}
