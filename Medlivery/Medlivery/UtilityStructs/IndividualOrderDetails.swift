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
    var storeName: String
    var storeAddress: String
    var storeCityState: String
    var storeZip: String
    var currentDate: String
    var address: String
    var cityState: String
    var photoURL: URL?
    
    init(name: String, email: String, phone: String, storeName: String, storeAddress: String, storeCityState: String, storeZip: String, currentDate: String, address: String, cityState: String, photoURL: URL?) {
        self.name = name
        self.email = email
        self.phone = phone
        self.storeName = storeName
        self.storeAddress = storeAddress
        self.storeCityState = storeCityState
        self.storeZip = storeZip
        self.currentDate = currentDate
        self.address = address
        self.cityState = cityState
        self.photoURL = photoURL
    }
    
}
