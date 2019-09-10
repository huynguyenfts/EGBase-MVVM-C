//
//  String+Ext.swift
//  EGBase-MVVM-C
//
//  Created by nguyen.duc.huy on 9/6/19.
//  Copyright © 2019 8Group. All rights reserved.
//

import Foundation

extension String {
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluate(with: self)
        return result
    }
    
}


