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
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "MM/dd/yy, HH:mm a"
//        dateFormatter.timeZone = TimeZone(identifier: "UTC") // Set the timezone to Eastern Standard Time (EST)
//        
//        guard let storedDate = dateFormatter.date(from: timeString) else {
//            return nil // Invalid time string format
//        }
//        
//        let currentDate = Date()
//        print(timeString)
//        print(currentDate)
//        print(storedDate)
//        return currentDate.timeIntervalSince(storedDate)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yy, h:mm a" // Adjusted the date format to use 'h' for 12-hour format
        dateFormatter.timeZone = TimeZone(identifier: "EST") // Set to Eastern Standard Time
        
        guard let estDate = dateFormatter.date(from: timeString) else {
            print("Error: Failed to parse the time string.")
            return nil // Return nil if parsing fails
        }
        
        // Check if the given date is within DST
        let isDST = TimeZone(identifier: "EST")!.isDaylightSavingTime(for: estDate)
        
        // Adjust the timezone to EDT (Eastern Daylight Time) if the date is within DST
        dateFormatter.timeZone = isDST ? TimeZone(identifier: "EDT") : TimeZone(identifier: "EST")
        
        // Convert EST date to UTC
        let utcDateString = dateFormatter.string(from: estDate)
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        guard let utcDate = dateFormatter.date(from: utcDateString) else {
            print("Error: Failed to convert EST date to UTC.")
            return nil // Return nil if conversion fails
        }
        
        if let currentDate = getCurrentDateInEST(){
//            print(utcDate)
//            print(currentDate)
            return currentDate.timeIntervalSince(utcDate)
        }
        return -1
    }
    
    static func getCurrentDateInEST() -> Date? {
        var calendar = Calendar.current
        calendar.timeZone = TimeZone(identifier: "EST")!
        
        // Get the current date and time
        return calendar.date(from: calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: Date()))
    }
    
    static let beigeColor: UIColor = UIColor(red: 253.0 / 255.0, green: 240.0 / 255.0, blue: 230 / 255.0, alpha: 1.0)
}
