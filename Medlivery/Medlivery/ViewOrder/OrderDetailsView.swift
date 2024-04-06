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
    var labelAge: UILabel!
    var labelAddressTitle: UILabel!
    var labelAddress: UILabel!
    var labelCityState: UILabel!
    var labelZip: UILabel!
    var labelPhone: UILabel!
    
    var labelEmail: UILabel!

    var buttonChat:UIButton!

    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = Utilities.beigeColor
        
//        setupImageContact()
        setupLabelName()
        setupLabelAge()
        setupLabelAddressTitle()
        setupLabelAddress()
        setupLabelCityState()
        setupLabelZip()
        setupLabelPhone()
        setupLabelEmail()
        initConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    //MARK: initializing the UI elements...
//    func setupImageContact(){
//        imageContact = UIImageView()
//        imageContact.image = UIImage(systemName: "photo")
//        imageContact.contentMode = .scaleToFill
//        imageContact.clipsToBounds = true
//        imageContact.layer.cornerRadius = 10
//        imageContact.translatesAutoresizingMaskIntoConstraints = false
//        self.addSubview(imageContact)
//    }
    
    func setupLabelName(){
        labelName = UILabel()
        labelName.textAlignment = .left
        labelName.text = "John Doe"
        labelName.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        labelName.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelName)
    }
    
    func setupLabelAge(){
        labelAge = UILabel()
        labelAge.textAlignment = .left
        labelAge.text = "35 years"
//        labelAge.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        labelAge.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelAge)
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
    
    func setupLabelAddressTitle(){
        labelAddressTitle = UILabel()
        labelAddressTitle.textAlignment = .left
        labelAddressTitle.text = "Address:"
        labelAddressTitle.font = UIFont.systemFont(ofSize: 24, weight: .bold)
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
    
    //MARK: initializing constraints...
    func initConstraints(){
        NSLayoutConstraint.activate([
            
//            imageContact.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 24),
//            imageContact.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
//            imageContact.heightAnchor.constraint(equalToConstant: 100),
//            imageContact.widthAnchor.constraint(equalToConstant: 100),
            
            labelName.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 24),
            labelName.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 16),
            
            labelAge.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: 24),
            labelAge.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 16),
            
            labelAddressTitle.topAnchor.constraint(equalTo: labelAge.bottomAnchor, constant: 16),
            labelAddressTitle.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 16),
            
            labelAddress.topAnchor.constraint(equalTo: labelAddressTitle.bottomAnchor, constant: 8),
            labelAddress.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 16),
            
            labelCityState.topAnchor.constraint(equalTo: labelAddress.bottomAnchor, constant: 4),
            labelCityState.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 16),
            
            labelZip.topAnchor.constraint(equalTo: labelCityState.bottomAnchor, constant: 4),
            labelZip.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 16),
            
            labelPhone.topAnchor.constraint(equalTo: labelZip.bottomAnchor, constant: 8),
            labelPhone.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 16),
            
            labelEmail.topAnchor.constraint(equalTo: labelPhone.bottomAnchor, constant: 16),
            labelEmail.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 16),

        ])
    }
    

}
