//
//  Place.swift
//  Medlivery
//
//  Created by Aadesh Mallya on 3/15/24.
//

import MapKit
import UIKit

class Place: NSObject, MKAnnotation {
    var title: String?
    var coordinate: CLLocationCoordinate2D
    var info: String
    var addressLine1: String?
    var addressLine2: String?
    var city: String?
    var state: String?
    var zipcode: String?
    var country: String?

    init(title: String, coordinate: CLLocationCoordinate2D, info: String, addressLine1: String, addressLine2: String, city: String, state: String, zipcode: String, country: String) {
        self.title = title
        self.coordinate = coordinate
        self.info = info
        self.addressLine1 = addressLine1
        self.addressLine2 = addressLine2
        self.city = city
        self.state = state
        self.zipcode = zipcode
        self.country = country
    }
    
    var mapItem: MKMapItem?{
        guard let location = title else{
            return nil
        }
        
        let placemark = MKPlacemark(
            coordinate: coordinate,
            addressDictionary:  [:]
        )
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = title
        
        return mapItem
    }
}
