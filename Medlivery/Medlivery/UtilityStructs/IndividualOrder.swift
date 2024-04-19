//
//  IndividualOrder.swift
//  Medlivery
//
//  Created by Abhishek Kumar on 4/9/24.
//

import Foundation
import FirebaseFirestoreSwift
import UIKit

struct IndividualOrder {
    
    var name: String
    var location: String
    var image: UIImage?
    var currentTime: String
    
    init(name: String, location: String, image: UIImage? = (UIImage(systemName: "photo"))!) {
        self.name = name
        self.location = location
        self.image = image
        let formatter = DateFormatter()

        formatter.dateStyle = .short
        formatter.timeStyle = .short
        let currentDate = Date()
        self.currentTime = formatter.string(from: currentDate)
    }
    
}
