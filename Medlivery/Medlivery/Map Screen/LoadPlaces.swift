//
//  LoadPlaces.swift
//  Medlivery
//
//  Created by Aadesh Mallya on 3/15/24.
//

import Foundation
import CoreLocation
import MapKit

extension ViewController {
    func loadPlacesAroundCurrentLocation() {
        guard let userLocation = locationManager.location else {
            print("Error: Unable to fetch user's current location.")
            return
        }
        
        let query = "pharmacy"
        
        // Load places around the current location with the specified query
        loadPlacesAround(query: query, location: userLocation.coordinate)
    }
    
    func loadPlacesAround(query: String, location: CLLocationCoordinate2D) {
        // Initialize the notification center
        let notificationCenter = NotificationCenter.default
        
        var mapItems = [MKMapItem]()
        
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = query
        
        // Set the region to search around the specified location
        let searchRegion = MKCoordinateRegion(center: location, latitudinalMeters: 1000, longitudinalMeters: 1000)
        searchRequest.region = searchRegion
        
        let search = MKLocalSearch(request: searchRequest)
        search.start { (response, error) in
            guard let response = response else {
                // Handle the error.
                return
            }
            mapItems = []
            
            for item in response.mapItems {
                print(item)
                if let name = item.name,
                   let location = item.placemark.location,
                   (name.lowercased().contains("cvs") ||
                    name.lowercased().contains("walgreens") ||
                    name.lowercased().contains("pharmacy")) {
                    
//                    print("\(name), \(location)")
                    mapItems.append(item)
                }
            }
            
            // Post the search results
            notificationCenter.post(name: .placesFromMap, object: mapItems)
        }
    }
}
