//
//  PKHUD+GitHub.swift
//  GitHub
//
//  Created by 築山朋紀 on 2019/06/17.
//  Copyright © 2019 築山朋紀. All rights reserved.
//

import PKHUD
import RxSwift
import RxCocoa

extension HUD {
    public class func showProgress() {
        HUD.show(.progress, onView: UIApplication.shared.windows.last)
    }
    
    public class func flashMessage(_ content: HUDContentType) {
        HUD.flash(
            content,
            onView: UIApplication.shared.keyWindow,
            delay: 2, completion: nil
        )
    }
}

extension SharedSequence where S == DriverSharingStrategy, E == Bool {
    func loader() -> Disposable {
        return self.drive(onNext: { result in
            if result {
                HUD.show(.progress, onView: UIApplication.shared.windows.last)
            } else {
                HUD.hide()
            }
        })
    }
}
