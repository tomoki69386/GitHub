//
//  BaseProvider.swift
//  GitHub
//
//  Created by 築山朋紀 on 2019/06/17.
//  Copyright © 2019 築山朋紀. All rights reserved.
//

import Moya
import UIKit
import RxSwift
import RxCocoa
import Alamofire

class BaseProvider: MoyaProvider<GithubAPI> {
    
    init() {
        var defaultPlugins: [PluginType] {
            let networkActivityPlugin = NetworkActivityPlugin(networkActivityClosure: { changeType, _  in
                DispatchQueue.main.async {
                    switch changeType {
                    case .began:
                        UIApplication.shared.isNetworkActivityIndicatorVisible = true
                    case .ended:
                        UIApplication.shared.isNetworkActivityIndicatorVisible = false
                    }
                }
            })
            return [networkActivityPlugin]
        }
        
        var plugins: [PluginType] = defaultPlugins
        plugins.append(contentsOf: plugins)
        
        let newEndpointClosure = { (target: GithubAPI) -> Endpoint in
            let headers: [String: String]? = [:]
            let endpoint = Endpoint(
                url: "\(target.baseURL)\(target.path)",
                sampleResponseClosure: { .networkResponse(200, target.sampleData) },
                method: target.method,
                task: target.task,
                httpHeaderFields: headers)
            return endpoint
        }
        
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 15
        configuration.httpAdditionalHeaders = Alamofire.SessionManager.defaultHTTPHeaders
        
        let newManager = Alamofire.SessionManager(configuration: configuration)
        
        let newRequestMapping = { (endpoint: Endpoint, closure: RequestResultClosure) -> Void in
            do {
                let urlRequest = try endpoint.urlRequest()
                closure(.success(urlRequest))
            } catch MoyaError.requestMapping(let url) {
                closure(.failure(MoyaError.requestMapping(url)))
            } catch MoyaError.parameterEncoding(let error) {
                closure(.failure(MoyaError.parameterEncoding(error)))
            } catch {
                closure(.failure(MoyaError.underlying(error, nil)))
            }
        }
        
        super.init(
            endpointClosure: newEndpointClosure,
            requestClosure: newRequestMapping,
            stubClosure: MoyaProvider.neverStub,
            callbackQueue: nil,
            manager: newManager,
            plugins: plugins,
            trackInflights: false
        )
    }
}
