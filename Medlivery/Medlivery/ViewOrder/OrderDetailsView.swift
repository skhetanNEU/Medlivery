//
//  OrderDetailsView.swift
//  Medlivery
//
//  Created by Abhishek Kumar on 4/5/24.
//

import UIKit

class OrderDetailsView: UIView {
//    var imageContact: UIImageView!
    var contentWrapper:UIScrollView!
    var labelName: UILabel!
    var labelEmail: UILabel!
    var labelPhone: UILabel!
    var labelStoreAddressTitle: UILabel!
//    var location: UILabel!
    var storeName: UILabel!
    var storeAddress: UILabel!
    var storeCityState: UILabel!
    var storeZip: UILabel!
    var dateOfOrder: UILabel!
    var labelAddressTitle: UILabel!
    var labelAddress: UILabel!
    var labelCityState: UILabel!
    var labelZip: UILabel!
    var imagePrescription: UIImageView!
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = Utilities.beigeColor
        
        setupContentWrapper()
        setupLabelName()
        setupLabelEmail()
        setupLabelPhone()
        setupLabelStoreAddressTitle()
        setupStoreName()
        setupStoreAddress()
        setupStoreCityState()
        setupStoreZip()
        
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
    
    func setupContentWrapper(){
        contentWrapper = UIScrollView()
        contentWrapper.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(contentWrapper)
    }
    
    //MARK: initializing the UI elements...
    func setupLabelName(){
        labelName = UILabel()
        labelName.textAlignment = .left
        labelName.text = "John Doe"
        labelName.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        labelName.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(labelName)
    }
    
    func setupLabelEmail(){
        labelEmail = UILabel()
        labelEmail.textAlignment = .left
        labelEmail.text = "john@gmail.com"
//        labelEmail.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        labelEmail.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(labelEmail)
    }
    
    func setupLabelPhone(){
        labelPhone = UILabel()
        labelPhone.textAlignment = .left
        labelPhone.text = "+1(857)492-6666"
        labelPhone.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(labelPhone)
    }
    
    func setupLabelStoreAddressTitle(){
        labelStoreAddressTitle = UILabel()
        labelStoreAddressTitle.textAlignment = .left
        labelStoreAddressTitle.text = "Store Address:"
        labelStoreAddressTitle.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        labelStoreAddressTitle.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(labelStoreAddressTitle)
    }
        
    func setupStoreName(){
        storeName = UILabel()
        storeName.textAlignment = .left
        
//        storeName.text = "CVS, Brighton"
        storeName.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(storeName)
    }
    
    func setupStoreAddress() {
        storeAddress = UILabel()
        storeAddress.textAlignment = .left
        
//        storeAddress.text = "CVS, Brighton"
        storeAddress.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(storeAddress)
        
    }
    
    func setupStoreCityState() {
        storeCityState = UILabel()
        storeCityState.textAlignment = .left
        
//        storeName.text = "CVS, Brighton"
        storeCityState.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(storeCityState)
        
    }
    
    func setupStoreZip() {
        storeZip = UILabel()
        storeZip.textAlignment = .left
        
//        storeName.text = "CVS, Brighton"
        storeZip.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(storeZip)
        
    }
    
    func setupDateOfOrder(){
        dateOfOrder = UILabel()
        dateOfOrder.textAlignment = .left
        
        dateOfOrder.text = "05/22/2024 13:22"
        dateOfOrder.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(dateOfOrder)
    }
    
    
    func setupLabelAddressTitle(){
        labelAddressTitle = UILabel()
        labelAddressTitle.textAlignment = .left
        labelAddressTitle.text = "Delivery Address:"
        labelAddressTitle.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        labelAddressTitle.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(labelAddressTitle)
    }
    
    
    func setupLabelAddress(){
        labelAddress = UILabel()
        labelAddress.textAlignment = .left
        
        labelAddress.text = "75 St. Alphonsus Street"
        labelAddress.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(labelAddress)
    }
    
    func setupLabelCityState(){
        labelCityState = UILabel()
        labelCityState.textAlignment = .left
        labelCityState.text = "Quincy, MA"
        labelCityState.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(labelCityState)
    }
    
    func setupLabelZip(){
        labelZip = UILabel()
        labelZip.textAlignment = .left
        labelZip.text = "02134"
        labelZip.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(labelZip)
    }
    
    func setupImagePrescription(){
        imagePrescription = UIImageView()
        imagePrescription.image = UIImage(systemName: "photo")
        imagePrescription.contentMode = .scaleToFill
        imagePrescription.clipsToBounds = true
        imagePrescription.layer.cornerRadius = 10
        imagePrescription.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(imagePrescription)
    }
    
    //MARK: initializing constraints...
    func initConstraints(){
        NSLayoutConstraint.activate([
            
            //MARK: contentWrapper constraints...
            contentWrapper.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            contentWrapper.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            contentWrapper.widthAnchor.constraint(equalTo:self.safeAreaLayoutGuide.widthAnchor),
            contentWrapper.heightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.heightAnchor),
            
            labelName.topAnchor.constraint(equalTo: contentWrapper.topAnchor, constant: 24),
            labelName.leftAnchor.constraint(equalTo: contentWrapper.leftAnchor, constant: 16),
            
            labelEmail.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: 12),
            labelEmail.leftAnchor.constraint(equalTo: contentWrapper.leftAnchor, constant: 16),
            
            labelPhone.topAnchor.constraint(equalTo: labelEmail.bottomAnchor, constant: 4),
            labelPhone.leftAnchor.constraint(equalTo: contentWrapper.leftAnchor, constant: 16),
            
            labelStoreAddressTitle.topAnchor.constraint(equalTo: labelPhone.bottomAnchor, constant: 16),
            labelStoreAddressTitle.leftAnchor.constraint(equalTo: contentWrapper.leftAnchor, constant: 16),
            
            storeName.topAnchor.constraint(equalTo: labelStoreAddressTitle.bottomAnchor, constant: 12),
            storeName.leftAnchor.constraint(equalTo: contentWrapper.leftAnchor, constant: 16),
            
            storeAddress.topAnchor.constraint(equalTo: storeName.bottomAnchor, constant: 4),
            storeAddress.leftAnchor.constraint(equalTo: contentWrapper.leftAnchor, constant: 16),
            
            storeCityState.topAnchor.constraint(equalTo: storeAddress.bottomAnchor, constant: 4),
            storeCityState.leftAnchor.constraint(equalTo: contentWrapper.leftAnchor, constant: 16),
            
            storeZip.topAnchor.constraint(equalTo: storeCityState.bottomAnchor, constant: 4),
            storeZip.leftAnchor.constraint(equalTo: contentWrapper.leftAnchor, constant: 16),
            
            dateOfOrder.topAnchor.constraint(equalTo: storeZip.bottomAnchor, constant: 4),
            dateOfOrder.leftAnchor.constraint(equalTo: contentWrapper.leftAnchor, constant: 16),
            
            labelAddressTitle.topAnchor.constraint(equalTo: dateOfOrder.bottomAnchor, constant: 16),
            labelAddressTitle.leftAnchor.constraint(equalTo: contentWrapper.leftAnchor, constant: 16),
            
            labelAddress.topAnchor.constraint(equalTo: labelAddressTitle.bottomAnchor, constant: 12),
            labelAddress.leftAnchor.constraint(equalTo: contentWrapper.leftAnchor, constant: 16),
            
            labelCityState.topAnchor.constraint(equalTo: labelAddress.bottomAnchor, constant: 4),
            labelCityState.leftAnchor.constraint(equalTo: contentWrapper.leftAnchor, constant: 16),
            
            labelZip.topAnchor.constraint(equalTo: labelCityState.bottomAnchor, constant: 4),
            labelZip.leftAnchor.constraint(equalTo: contentWrapper.leftAnchor, constant: 16),
            
            imagePrescription.topAnchor.constraint(equalTo: labelZip.bottomAnchor, constant: 16),
            imagePrescription.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            imagePrescription.heightAnchor.constraint(equalToConstant: 400),
            imagePrescription.widthAnchor.constraint(equalToConstant: 300),
            imagePrescription.bottomAnchor.constraint(equalTo: contentWrapper.bottomAnchor)
                        

        ])
    }
    

}
