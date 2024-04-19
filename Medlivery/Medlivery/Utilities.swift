//
//  Utilities.swift
//  Medlivery
//
//  Created by Satvik Khetan on 4/5/24.
//

import Foundation
import UIKit

class Utilities{
    static func validEmail(_ email: String) ->Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    static func validPhoneNumber(_ phoneNumber: String) ->Bool {
        let phoneNumberRegex = #"^\d{10}$"#
        let predicate = NSPredicate(format: "SELF MATCHES %@", phoneNumberRegex)
        return predicate.evaluate(with: phoneNumber)
    }
    
    static func validZIP(_ zip: String) ->Bool {
        let zipRegex = #"^\d{5}$"#
        let predicate = NSPredicate(format: "SELF MATCHES %@", zipRegex)
        let validFormat = predicate.evaluate(with: zip)
        if (!validFormat){
            return false
        }
        if let value = Int(zip){
            if value >= 1 && value <= 99950 {
                return true
            }
        }
        return false
    }
    
    static func getTimeDifference(fromTimeString timeString: String) -> TimeInterval? {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yy, HH:mm"
            
        // Parse the given time string into a Date object
        guard let givenDate = formatter.date(from: timeString) else {
            print("Invalid date format")
            return -1
        }
            
        let currentDate = Date()
        let timeDifference = currentDate.timeIntervalSince(givenDate)
        
        return timeDifference
    }
    
//    static func getCurrentDateInEST() -> Date? {
//        var calendar = Calendar.current
//        calendar.timeZone = TimeZone(identifier: "EST")!
//        return calendar.date(from: calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: Date()))
//    }
    
    static let beigeColor: UIColor = UIColor(red: 253.0 / 255.0, green: 240.0 / 255.0, blue: 230 / 255.0, alpha: 1.0)
}
