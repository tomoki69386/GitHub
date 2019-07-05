//
//  StringTests.swift
//  GitHubTests
//
//  Created by 築山朋紀 on 2019/07/06.
//  Copyright © 2019 築山朋紀. All rights reserved.
//

import Foundation
import XCTest
@testable import GitHub_dev

class StringTests: XCTestCase {
    
    func testsSearch() {
        let str = "Hello Swift"
        
        XCTAssertTrue(str.search(by: "Hello"))
        XCTAssertTrue(str.search(by: "HELLO"))
        XCTAssertTrue(str.search(by: "swi"))
        
        XCTAssertFalse(str.search(by: "hoge"))
    }
}
