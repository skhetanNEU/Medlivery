//
//  MapView.swift
//  Medlivery
//
//  Created by Aadesh on 4/5/24.
//

import UIKit
import MapKit

class MapView: UIView {
    var mapView:MKMapView!
    var buttonLoading:UIButton!
    var buttonCurrentLocation:UIButton!
    var buttonSearch:UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(red: 51/255, green: 52/255, blue: 71/255, alpha: 1)
        setupMapView()
        setupButtonLoading()
        setupButtonCurrentLocation()
        initConstraints()
    }
    
    func setupMapView(){
        mapView = MKMapView()
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.layer.cornerRadius = 10
        mapView.overrideUserInterfaceStyle = .dark
        mapView.showsUserLocation = true
        self.addSubview(mapView)
    }
    
    func setupButtonLoading(){
        buttonLoading = UIButton(type: .system)
        buttonLoading.setTitle(" Fetching Location...  ", for: .normal)
        buttonLoading.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        buttonLoading.setImage(UIImage(systemName: "circle.dotted"), for: .normal)
        buttonLoading.layer.backgroundColor = UIColor.black.cgColor
        buttonLoading.tintColor = .white
        buttonLoading.layer.cornerRadius = 10
        
        buttonLoading.layer.shadowOffset = .zero
        buttonLoading.layer.shadowRadius = 4
        buttonLoading.layer.shadowOpacity = 0.7
        
        buttonLoading.translatesAutoresizingMaskIntoConstraints = false
        
        buttonLoading.isEnabled = false
        self.addSubview(buttonLoading)
    }
    
    func setupButtonCurrentLocation(){
        buttonCurrentLocation = UIButton(type: .system)
        buttonCurrentLocation.setImage(UIImage(systemName: "location.circle"), for: .normal)
        buttonCurrentLocation.layer.backgroundColor = UIColor.lightGray.cgColor
        buttonCurrentLocation.tintColor = .blue
        buttonCurrentLocation.layer.cornerRadius = 10
        
        buttonCurrentLocation.layer.shadowOffset = .zero
        buttonCurrentLocation.layer.shadowRadius = 4
        buttonCurrentLocation.layer.shadowOpacity = 0.7
        
        buttonCurrentLocation.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(buttonCurrentLocation)
    }
    
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: self.topAnchor), // Align top of mapView to top of superview
            mapView.leadingAnchor.constraint(equalTo: self.leadingAnchor), // Align leading edge of mapView to leading edge of superview
            mapView.trailingAnchor.constraint(equalTo: self.trailingAnchor), // Align trailing edge of mapView to trailing edge of superview
            mapView.bottomAnchor.constraint(equalTo: self.bottomAnchor), // Align bottom of mapView to bottom of superview
            
            buttonLoading.centerXAnchor.constraint(equalTo: mapView.centerXAnchor),
            buttonLoading.centerYAnchor.constraint(equalTo: mapView.centerYAnchor),
            buttonLoading.widthAnchor.constraint(equalToConstant: 240),
            buttonLoading.heightAnchor.constraint(equalToConstant: 40),
            
            buttonCurrentLocation.trailingAnchor.constraint(equalTo: mapView.trailingAnchor, constant: -16),
            buttonCurrentLocation.bottomAnchor.constraint(equalTo: mapView.bottomAnchor, constant: -8),
            buttonCurrentLocation.heightAnchor.constraint(equalToConstant: 36),
            buttonCurrentLocation.widthAnchor.constraint(equalToConstant: 36),

        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

