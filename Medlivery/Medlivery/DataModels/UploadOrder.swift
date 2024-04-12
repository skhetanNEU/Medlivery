//
//  UploadOrder.swift
//  Medlivery
//
//  Created by Abhishek Kumar on 4/12/24.
//
    
import FirebaseFirestoreSwift
import UIKit

struct UploadOrder: Codable{
    
    @DocumentID var id: String?
    var location: String
    var currentTime: String
    
    init(location: String, currentTime: String) {
        self.location = location
        self.currentTime = currentTime
    }
}
