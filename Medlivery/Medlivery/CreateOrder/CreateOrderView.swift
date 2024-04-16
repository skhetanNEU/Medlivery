//
//  CreateOrderView.swift
//  Medlivery
//
//  Created by Abhishek Kumar on 4/5/24.
//

import UIKit

class CreateOrderView: UIView {
    
    var contentWrapper:UIScrollView!
    var labelLocation: UILabel!
    var textFieldLocation: UILabel!
    var navigationButton: UIButton!
    var labelUploadPrescription: UILabel!
    var buttonUploadPrescription: UIButton!
    var buttonCreateOrder: UIButton!
    // Boolean flag to track if an image is selected or not
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = Utilities.beigeColor
        
        setupContentWrapper()
        setupLabelLocation()
        setupTextFieldLocation()
        setupNavigationIconButton()
        setupLabelUploadPrescription()
        setupButtonUploadPrescription()
        setupButtonCreateOrder()
        
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
    
    
    func setupLabelLocation(){
        labelLocation = UILabel()
        labelLocation.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        labelLocation.text = "Location"
//        labelName.font = UIFont.boldSystemFont(ofSize: 16)
        labelLocation.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(labelLocation)
    }
    
    func setupTextFieldLocation(){
        textFieldLocation = UILabel()
        textFieldLocation.text = "Select Location"
        textFieldLocation.translatesAutoresizingMaskIntoConstraints = false
        textFieldLocation.widthAnchor.constraint(equalToConstant: 320).isActive = true
        contentWrapper.addSubview(textFieldLocation)
    }
    
    func setupNavigationIconButton() {
        let navigationIcon = UIImage(systemName: "arrow.up.right.circle.fill")
        navigationButton = UIButton(type: .system)
        navigationButton.setImage(navigationIcon, for: .normal)
        navigationButton.tintColor = .systemBlue
        navigationButton.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(navigationButton)
    }
    
    func setupLabelUploadPrescription(){
        labelUploadPrescription = UILabel()
        labelUploadPrescription.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        labelUploadPrescription.text = "Upload Prescription"
//        labelUploadPrescription.font = UIFont.boldSystemFont(ofSize: 16)
        labelUploadPrescription.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(labelUploadPrescription)
    }
    
    func setupButtonUploadPrescription(){
        buttonUploadPrescription = UIButton(type: .system)
        buttonUploadPrescription.setTitle("", for: .normal)
        
        // Set the symbol configuration to increase the image size
        let configuration = UIImage.SymbolConfiguration(pointSize: 100) // Adjust pointSize as needed
        buttonUploadPrescription.setPreferredSymbolConfiguration(configuration, forImageIn: .normal)
        
        buttonUploadPrescription.setImage(UIImage(systemName: "camera.fill"), for: .normal)
        buttonUploadPrescription.contentHorizontalAlignment = .fill
        buttonUploadPrescription.contentVerticalAlignment = .fill
        buttonUploadPrescription.imageView?.contentMode = .scaleToFill
        buttonUploadPrescription.showsMenuAsPrimaryAction = true

        buttonUploadPrescription.translatesAutoresizingMaskIntoConstraints = false

        contentWrapper.addSubview(buttonUploadPrescription)
    }
    

    func setupButtonCreateOrder(){
        buttonCreateOrder = UIButton(type: .system)
        buttonCreateOrder.setTitle("Create Order", for: .normal)
        buttonCreateOrder.titleLabel?.font = .boldSystemFont(ofSize: 25)
        buttonCreateOrder.backgroundColor = .systemTeal
        buttonCreateOrder.layer.cornerRadius = 16 // Adjust corner radius as needed
        buttonCreateOrder.setTitleColor(.white, for: .normal)
        buttonCreateOrder.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(buttonCreateOrder)
    }
    
    
    //MARK: initializing constraints...
    func initConstraints(){
        NSLayoutConstraint.activate([
            
            contentWrapper.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            contentWrapper.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            contentWrapper.widthAnchor.constraint(equalTo:self.safeAreaLayoutGuide.widthAnchor),
            contentWrapper.heightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.heightAnchor),
            
            labelLocation.topAnchor.constraint(equalTo: contentWrapper.topAnchor, constant: 28),
            labelLocation.leftAnchor.constraint(equalTo: contentWrapper.leftAnchor, constant: 30),
            
            textFieldLocation.topAnchor.constraint(equalTo: labelLocation.bottomAnchor, constant: 16),
            textFieldLocation.leftAnchor.constraint(equalTo: contentWrapper.leftAnchor, constant: 30),
            textFieldLocation.trailingAnchor.constraint(equalTo: contentWrapper.trailingAnchor, constant: -60),
            
            navigationButton.topAnchor.constraint(equalTo: textFieldLocation.topAnchor),
            navigationButton.leadingAnchor.constraint(equalTo: textFieldLocation.trailingAnchor, constant: 8),
            navigationButton.trailingAnchor.constraint(equalTo: contentWrapper.trailingAnchor, constant: -30),
            navigationButton.heightAnchor.constraint(equalTo: textFieldLocation.heightAnchor),
//            navigationButton.widthAnchor.constraint(equalTo: navigationButton.heightAnchor),
            
            labelUploadPrescription.topAnchor.constraint(equalTo: textFieldLocation.bottomAnchor, constant: 24),
            labelUploadPrescription.leftAnchor.constraint(equalTo: contentWrapper.leftAnchor, constant: 30),
            
            buttonUploadPrescription.topAnchor.constraint(equalTo: labelUploadPrescription.bottomAnchor, constant: 16),
            buttonUploadPrescription.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            buttonUploadPrescription.bottomAnchor.constraint(equalTo: contentWrapper.bottomAnchor),
            
//            buttonUploadPrescription.widthAnchor.constraint(equalToConstant: 100),
//            buttonUploadPrescription.heightAnchor.constraint(equalToConstant: 100),
           
//            buttonCreateOrder.leadingAnchor.constraint(equalTo: contentWrapper.leadingAnchor, constant: 12),
//            buttonCreateOrder.trailingAnchor.constraint(equalTo: contentWrapper.trailingAnchor, constant: -12),
//            buttonCreateOrder.bottomAnchor.constraint(equalTo: contentWrapper.bottomAnchor, constant: -16),
            
            buttonCreateOrder.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            buttonCreateOrder.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 12),
            buttonCreateOrder.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -12),

        ])
    }
    

}
