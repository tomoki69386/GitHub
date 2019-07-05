//
//  String+GitHub.swift
//  GitHub
//
//  Created by 築山朋紀 on 2019/07/06.
//  Copyright © 2019 築山朋紀. All rights reserved.
//

import Foundation

extension String {
    
    func search(by query: String) -> Bool {
        if let _ = self.range(of: query) {
            return true
        }
        if self.lowercased().contains(query) {
            return true
        }
        if self.localizedCaseInsensitiveContains(query) {
            return true
        }
        return false
    }
}
