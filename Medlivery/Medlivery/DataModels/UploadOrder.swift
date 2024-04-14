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
//    var location: String
    var storeName: String
    var storeAddress: String
    var storeCityState: String
    var zip: String
    var currentTime: String
    var photoURL: URL?
    
    init(storeName: String, storeAddress: String, storeCityState: String, zip: String, currentTime: String, photoURL: URL?) {
        self.storeName = storeName
        self.storeAddress = storeAddress
        self.storeCityState = storeCityState
        self.zip = zip
        self.currentTime = currentTime
        self.photoURL = photoURL
    }
}
