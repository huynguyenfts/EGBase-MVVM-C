//
//  File.swift
//  EGBase-MVVM-C
//
//  Created by nguyen.duc.huy on 9/10/19.
//  Copyright © 2019 8Group. All rights reserved.
//

import Foundation

struct Logger {
    static func log(_ message: String? = nil) {
        print("🤡🤡🤡 Called by \(#file) - \(#function) at line \(#line): \(String(describing: message))")
    }
}
