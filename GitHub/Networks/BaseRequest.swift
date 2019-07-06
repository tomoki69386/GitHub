//
//  BaseRequest.swift
//  GitHub
//
//  Created by 築山朋紀 on 2019/07/07.
//  Copyright © 2019 築山朋紀. All rights reserved.
//

import Foundation
import Moya

protocol BaseRequest: TargetType { }
extension BaseRequest {
    var baseURL: URL {
        return URL(string: "https://api.github.com")!
    }
    var headers: [String : String]? {
        return nil
    }
}
