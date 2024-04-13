//
//  Message.swift
//  Medlivery
//
//  Created by Aadesh on 4/12/24.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Message: Codable {
    @DocumentID var id: String?
    var receiverID: String
    var senderID: String
    var text: String
    var timestamp: Timestamp
    
    init(receiverID: String, senderID: String, text: String, timestamp: Timestamp) {
        self.receiverID = receiverID
        self.senderID = senderID
        self.text = text
        self.timestamp = timestamp
    }
}
