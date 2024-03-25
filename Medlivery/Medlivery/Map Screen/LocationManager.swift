//
//  LocationManager.swift
//  Medlivery
//
//  Created by Aadesh Mallya on 3/15/24.
//

import Foundation
import CoreLocation

//MARK: setting up location manager delegate...
extension ViewController: CLLocationManagerDelegate{
    func setupLocationManager(){
        //MARK: setting up location manager to get the current location...
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        //MARK: if the user either allows location while using the app or always...
        if manager.authorizationStatus == .authorizedWhenInUse
            || manager.authorizationStatus == .authorizedAlways{
            manager.requestLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first{
            mapView.mapView.centerToLocation(location: location)
            // You may want to stop updating location once you have it, to avoid unnecessary updates
            manager.stopUpdatingLocation()
            mapView.buttonLoading.isHidden = true
            mapView.buttonSearch.isHidden = false
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("location error: \(error.localizedDescription)")
    }
}
