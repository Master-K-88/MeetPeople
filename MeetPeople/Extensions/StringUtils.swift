//
//  StringUtils.swift
//  MeetPeople
//
//  Created by Prof K on 10/6/22.
//

import Foundation
extension String {
    
    func isEmailValid() -> Bool {
        let emailTest =  NSPredicate(format: "SELF MATCHES %@", "^([a-zA-Z0-9_\\-\\.]+)@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.)|(([a-zA-Z0-9\\-]+\\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\\]?)$")
        return emailTest.evaluate(with: self)
    }
    
    func isPasswordValid() -> Bool {
        let passwordTest =  NSPredicate(format: "SELF MATCHES %@", "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).{8,15}$")
        return passwordTest.evaluate(with: self)
    }
}
