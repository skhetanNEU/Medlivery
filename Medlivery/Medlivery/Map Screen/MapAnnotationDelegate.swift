//
//  MapAnnotationDelegate.swift
//  Medlivery
//  Created by Aadesh Mallya on 3/15/24.
//

import Foundation
import MapKit

extension MapViewController: MKMapViewDelegate{
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation)
        -> MKAnnotationView? {
        guard let annotation = annotation as? Place else { return nil }
        
        var view:MKMarkerAnnotationView
        
        if let annotationView = mapView.dequeueReusableAnnotationView(
            withIdentifier: Configs.placeIdentifier) as? MKMarkerAnnotationView{
            annotationView.annotation = annotation
            view = annotationView
        }else{
            view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: Configs.placeIdentifier)
            view.canShowCallout = true
            view.calloutOffset = CGPoint(x: -5, y: 5)
            view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        }
        return view
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        
        guard let annotation = view.annotation as? Place else { return }
        
        createOrder.storeName = annotation.title
        createOrder.storeAddressLine1 = annotation.addressLine1
        createOrder.storeAddressLine2 = annotation.addressLine2
        createOrder.storeAddressCity = annotation.city
        createOrder.storeAddressState = annotation.state
        createOrder.storeAddressZip = annotation.zipcode
        createOrder.storeAddressCountry = annotation.country
        createOrder.setPlaceName()
        self.navigationController?.popViewController(animated: true) }
}
