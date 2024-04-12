//
//  IndividualOrderDetails.swift
//  Medlivery
//
//  Created by Abhishek Kumar on 4/9/24.
//

import Foundation
import UIKit

struct IndividualOrderDetails{
    
    var name: String?
    var email: String?
    var phone: String?
    var orderName: String?
    var location: String?
    var currentDate: String?
    var address: String?
    var cityState: String?
    var zip: String?
    var image: UIImage?
    
    init(name: String?, email: String? = nil, phone: String? = nil, orderName: String? = nil, location: String? = nil, currentDate: String? = nil, address: String? = nil, cityState: String? = nil, zip: String? = nil, image: UIImage? = (UIImage(systemName: "photo"))!) {
        self.name = name
        self.email = email
        self.phone = phone
        self.orderName = orderName
        self.location = location
        self.currentDate = currentDate
        self.address = address
        self.cityState = cityState
        self.zip = zip
        self.image = image
    }
    
}
