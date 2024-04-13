//
//  IndividualOrderDetails.swift
//  Medlivery
//
//  Created by Abhishek Kumar on 4/9/24.
//

import Foundation
import UIKit

struct IndividualOrderDetails{
    
    var name: String
    var email: String
    var phone: String
//    var orderName: String
    var location: String
    var currentDate: String
    var address: String
    var cityState: String
    var photoURL: URL?
    
//    init(name: String, email: String, phone: String, location: String, currentDate: String, address: String, cityState: String, zip: String? = nil, image: UIImage? = (UIImage(systemName: "photo"))!) {
    
    init(name: String, email: String, phone: String, location: String, currentDate: String, address: String, cityState: String, photoURL: URL?) {
        self.name = name
        self.email = email
        self.phone = phone
        self.location = location
        self.currentDate = currentDate
        self.address = address
        self.cityState = cityState
        self.photoURL = photoURL
    }
    
}
