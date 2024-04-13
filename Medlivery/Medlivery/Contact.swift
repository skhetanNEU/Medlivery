//
//  Contact.swift
//  Medlivery
//
//  Created by Aadesh on 4/12/24.
//

import Foundation
import FirebaseFirestoreSwift

struct Contact: Codable{
    @DocumentID var id: String?
    var name: String
    var email: String
    var phone: Int
    
    var dictionary: [String: Any] {
            return [
                "name": name,
                "email": email,
                "phone": phone
            ]
        }
    
    init(name: String, email: String, phone: Int) {
        self.name = name
        self.email = email
        self.phone = phone
    }
}
