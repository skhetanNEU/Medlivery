//
//  MapViewController.swift
//  Medlivery
//
//  Created by Aadesh on 4/5/24.
//

import UIKit
import CoreLocation
import MapKit

class MapViewController: UIViewController {

    let mapView = MapView()
    var selectedPlaceName: String?
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
        navigationController?.navigationBar.prefersLargeTitles = true
        
        mapView.buttonCurrentLocation.addTarget(self, action: #selector(onButtonCurrentLocationTapped), for: .touchUpInside)
                
        setupLocationManager()
        
        onButtonCurrentLocationTapped()
        
        
       // let northeastern = Place(
       //     title: "Northeastern University",
       //     coordinate: CLLocationCoordinate2D(latitude: 42.339918, longitude: -71.089797),
       //     info: "LVX VERITAS VIRTVS"
       // )
        
       // mapView.mapView.addAnnotation(northeastern)
        mapView.mapView.delegate = self
        
    }
    
    @objc func onButtonCurrentLocationTapped(){
        if let uwLocation = locationManager.location{
            mapView.mapView.centerToLocation(location: uwLocation)
        }
        
    }
    
    @objc func onButtonSearchTapped() {
        print("on search button tapped called)")
        
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
        let place = Place(
            title: placeItem.name!,
            coordinate: coordinate,
            info: placeItem.description
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

