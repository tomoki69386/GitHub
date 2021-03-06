//
//  GithubAPI.swift
//  GitHub
//
//  Created by 築山朋紀 on 2019/06/17.
//  Copyright © 2019 築山朋紀. All rights reserved.
//

import UIKit
import Moya
import Alamofire

enum GithubAPI {
    case getMe
    case getUser(name: String)
    case following(name: String)
    case follower(name: String)
}

extension GithubAPI: TargetType {
    var headers: [String : String]? {
        return ["": ""]
    }
    var baseURL: URL {
        return URL(string: "https://api.github.com")!
    }
    
    var path: String {
        switch self {
        case .getMe:
            return "/users/tomoki69386"
        case .getUser(let name):
            return "/users/\(name)"
        case .following(let name):
            return "/users/\(name)/following"
        case .follower(let name):
            return "/users/\(name)/followers"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getMe, .getUser, .following, .follower:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        let parameters: [String: Any] = self.parameters ?? [:]
        return .requestParameters(parameters: parameters, encoding: parameterEncoding)
        
    }
    
    var parameterEncoding: Moya.ParameterEncoding {
        let encoding: Moya.ParameterEncoding
        encoding = URLEncoding.default
        return encoding
    }
    
    var parameters: [String: Any]? {
        return [:]
    }
}
