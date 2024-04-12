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
    
    var name: String?
    var location: String?
    var image: UIImage?
    var currentTime: String
    
    init(name: String?, location: String? = nil, image: UIImage? = (UIImage(systemName: "photo"))!) {
        self.name = name
        self.location = location
        self.image = image
        let formatter = DateFormatter()
        formatter.dateStyle = .short // Set dateStyle to .short
        formatter.timeStyle = .short
//        let currentDate = Date()
        self.currentTime = formatter.string(from: Date())
        
    }
    
}
