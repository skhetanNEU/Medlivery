//
//  OrderDetailsView.swift
//  Medlivery
//
//  Created by Abhishek Kumar on 4/5/24.
//

import UIKit

class OrderDetailsView: UIView {
//    var imageContact: UIImageView!
    var labelName: UILabel!
    var labelEmail: UILabel!
    var labelPhone: UILabel!
    var labelStoreAddressTitle: UILabel!
//    var location: UILabel!
    var storeLocation: UILabel!
    var dateOfOrder: UILabel!
    var labelAddressTitle: UILabel!
    var labelAddress: UILabel!
    var labelCityState: UILabel!
    var labelZip: UILabel!
    var imagePrescription: UIImageView!
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = Utilities.beigeColor
        
        setupLabelName()
        setupLabelEmail()
        setupLabelPhone()
        setupLabelStoreAddressTitle()
        setupStoreLocation()
        setupDateOfOrder()
        setupLabelAddressTitle()
        setupLabelAddress()
        setupLabelCityState()
        setupLabelZip()
        setupImagePrescription()
        
        initConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: initializing the UI elements...
    func setupLabelName(){
        labelName = UILabel()
        labelName.textAlignment = .left
        labelName.text = "John Doe"
        labelName.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        labelName.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelName)
    }
    
    func setupLabelEmail(){
        labelEmail = UILabel()
        labelEmail.textAlignment = .left
        labelEmail.text = "john@gmail.com"
//        labelEmail.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        labelEmail.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelEmail)
    }
    
    func setupLabelPhone(){
        labelPhone = UILabel()
        labelPhone.textAlignment = .left
        labelPhone.text = "+1(857)492-6666"
        labelPhone.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelPhone)
    }
    
    func setupLabelStoreAddressTitle(){
        labelStoreAddressTitle = UILabel()
        labelStoreAddressTitle.textAlignment = .left
        labelStoreAddressTitle.text = "Store Address:"
        labelStoreAddressTitle.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        labelStoreAddressTitle.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelStoreAddressTitle)
    }
        
    func setupStoreLocation(){
        storeLocation = UILabel()
        storeLocation.textAlignment = .left
        
        storeLocation.text = "CVS, Allston"
        storeLocation.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(storeLocation)
    }
    
    func setupDateOfOrder(){
        dateOfOrder = UILabel()
        dateOfOrder.textAlignment = .left
        
        dateOfOrder.text = "05/22/2024 13:22"
        dateOfOrder.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(dateOfOrder)
    }
    
    
    func setupLabelAddressTitle(){
        labelAddressTitle = UILabel()
        labelAddressTitle.textAlignment = .left
        labelAddressTitle.text = "Delivery Address:"
        labelAddressTitle.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        labelAddressTitle.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelAddressTitle)
    }
    
    
    func setupLabelAddress(){
        labelAddress = UILabel()
        labelAddress.textAlignment = .left
        
        labelAddress.text = "604 Cambridge Street, Allston"
        labelAddress.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelAddress)
    }
    
    func setupLabelCityState(){
        labelCityState = UILabel()
        labelCityState.textAlignment = .left
        labelCityState.text = "Boston, MA"
        labelCityState.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelCityState)
    }
    
    func setupLabelZip(){
        labelZip = UILabel()
        labelZip.textAlignment = .left
        labelZip.text = "02134"
        labelZip.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelZip)
    }
    
    func setupImagePrescription(){
        imagePrescription = UIImageView()
        imagePrescription.image = UIImage(systemName: "photo")
        imagePrescription.contentMode = .scaleToFill
        imagePrescription.clipsToBounds = true
        imagePrescription.layer.cornerRadius = 10
        imagePrescription.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(imagePrescription)
    }
    
    //MARK: initializing constraints...
    func initConstraints(){
        NSLayoutConstraint.activate([
            
            labelName.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 24),
            labelName.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 16),
            
            labelEmail.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: 12),
            labelEmail.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 16),
            
            labelPhone.topAnchor.constraint(equalTo: labelEmail.bottomAnchor, constant: 4),
            labelPhone.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 16),
            
            labelStoreAddressTitle.topAnchor.constraint(equalTo: labelPhone.bottomAnchor, constant: 16),
            labelStoreAddressTitle.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 16),
            
            storeLocation.topAnchor.constraint(equalTo: labelStoreAddressTitle.bottomAnchor, constant: 12),
            storeLocation.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 16),
            
            dateOfOrder.topAnchor.constraint(equalTo: storeLocation.bottomAnchor, constant: 4),
            dateOfOrder.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 16),
            
            labelAddressTitle.topAnchor.constraint(equalTo: dateOfOrder.bottomAnchor, constant: 16),
            labelAddressTitle.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 16),
            
            labelAddress.topAnchor.constraint(equalTo: labelAddressTitle.bottomAnchor, constant: 12),
            labelAddress.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 16),
            
            labelCityState.topAnchor.constraint(equalTo: labelAddress.bottomAnchor, constant: 4),
            labelCityState.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 16),
            
            labelZip.topAnchor.constraint(equalTo: labelCityState.bottomAnchor, constant: 4),
            labelZip.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 16),
            
            imagePrescription.topAnchor.constraint(equalTo: labelZip.bottomAnchor, constant: 16),
            imagePrescription.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            imagePrescription.heightAnchor.constraint(equalToConstant: 400),
            imagePrescription.widthAnchor.constraint(equalToConstant: 300),
                        

        ])
    }
    

}
