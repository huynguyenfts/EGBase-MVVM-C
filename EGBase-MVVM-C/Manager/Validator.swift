//
//  Validator.swift
//  EGBase-MVVM-C
//
//  Created by nguyen.duc.huy on 9/24/19.
//  Copyright © 2019 8Group. All rights reserved.
//

import Foundation

class Validator {
    static func isValidEmail(_ email:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluate(with: email)
        return result
    }
    
    static func isValidPassword(_ password: String) -> Bool {
        if password.count > 30 {
            return false
        }
        
        if password.count < 8 {
            return false
        }
        return true
    }
}
