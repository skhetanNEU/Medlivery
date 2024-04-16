//
//  MapViewController.swift
//  Medlivery
//
//  Created by Aadesh on 4/5/24.
//

import UIKit
import CoreLocation
import MapKit
import Contacts

class MapViewController: UIViewController {

    let mapView = MapView()
    var createOrder: CreateOrderController!
    
    let locationManager = CLLocationManager()
    
    override func loadView() {
        view = mapView
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        onButtonSearchTapped()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Search in Map"
        let backButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(backButtonTapped))
            self.navigationItem.leftBarButtonItem = backButton
        
        mapView.buttonCurrentLocation.addTarget(self, action: #selector(onButtonCurrentLocationTapped), for: .touchUpInside)
        setupLocationManager()
        onButtonCurrentLocationTapped()
        
        mapView.mapView.delegate = self
        
    }
    
    @objc func backButtonTapped() {
        if self.navigationController?.viewControllers.count ?? 0 > 1 {
            self.navigationController?.popViewController(animated: true)
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @objc func onButtonCurrentLocationTapped(){
        if let uwLocation = locationManager.location{
            mapView.mapView.centerToLocation(location: uwLocation)
        }
        
    }
    
    @objc func onButtonSearchTapped() {
        let searchViewController = SearchViewController()
        searchViewController.delegateToMapView = self
        
        let navForSearch = UINavigationController(rootViewController: searchViewController)
        navForSearch.modalPresentationStyle = .custom
        navForSearch.transitioningDelegate = self
        
        present(navForSearch, animated: true)
    }

    
    //MARK: show selected place on map...
    func showSelectedPlace(placeItem: MKMapItem){
        let coordinate = placeItem.placemark.coordinate
        mapView.mapView.centerToLocation(
            location: CLLocation(
                latitude: coordinate.latitude,
                longitude: coordinate.longitude
            )
        )
        
        let postalAddress = CNMutablePostalAddress()
           postalAddress.street = placeItem.placemark.thoroughfare ?? ""
           postalAddress.subLocality = placeItem.placemark.subLocality ?? ""
           postalAddress.city = placeItem.placemark.locality ?? ""
           postalAddress.state = placeItem.placemark.administrativeArea ?? ""
           postalAddress.postalCode = placeItem.placemark.postalCode ?? ""
           postalAddress.country = placeItem.placemark.country ?? ""
            
        let place = Place(
            title: placeItem.name!,
            coordinate: coordinate,
            info: placeItem.description,
            addressLine1:postalAddress.street,
            addressLine2:postalAddress.subLocality,
            city: postalAddress.city,
            state: postalAddress.state,
            zipcode: postalAddress.postalCode,
            country: postalAddress.country
            )
        mapView.mapView.addAnnotation(place)
    }

}

extension MapViewController: UIViewControllerTransitioningDelegate, UIAdaptivePresentationControllerDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
            let presentationController = CustomPresentationController(presentedViewController: presented, presenting: presenting)
            presentationController.delegate = self
            return presentationController
        }
    
    func presentationControllerShouldDismiss(_ presentationController: UIPresentationController) -> Bool {
        return false
    }
}

extension MKMapView{
    func centerToLocation(location: CLLocation, radius: CLLocationDistance = 1000){
        let coordinateRegion = MKCoordinateRegion(
            center: location.coordinate,
            latitudinalMeters: radius,
            longitudinalMeters: radius
        )
        setRegion(coordinateRegion, animated: true)
    }
}

