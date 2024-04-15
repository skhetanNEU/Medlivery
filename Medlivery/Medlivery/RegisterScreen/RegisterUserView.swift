//
//  RegisterUserView.swift
//  Medlivery
//
//  Created by Satvik Khetan on 4/3/24.
//

import UIKit

class RegisterUserView: UIView {
    
    var contentWrapper:UIScrollView!
    var textFieldName: UITextField!
    var textFieldEmail: UITextField!
    var textFieldPhoneNumber: UITextField!
    var textFieldAddress: UITextField!
    var textFieldCity: UITextField!
    var textFieldPassword: UITextField!
    var textFieldPasswordRepeat: UITextField!
    var buttonRegister: UIButton!
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        self.backgroundColor = Utilities.beigeColor
        
        setupContentWrapper()
        setupTextFieldName()
        setupTextFieldEmail()
        setupTextFieldPhoneNumber()
        setupTextFieldAddress()
        setupTextFieldCity()
        setupTextFieldPassword()
        setupTextFieldPasswordRepeat()
        setupButtonRegister()
        
        initConstraints()
    }
    
    func setupContentWrapper(){
        contentWrapper = UIScrollView()
        contentWrapper.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(contentWrapper)
    }
    
    func setupTextFieldName(){
        textFieldName = UITextField()
        textFieldName.placeholder = "Name"
        textFieldName.borderStyle = .roundedRect
        textFieldName.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(textFieldName)
    }
    
    func setupTextFieldEmail(){
        textFieldEmail = UITextField()
        textFieldEmail.placeholder = "Email"
        textFieldEmail.borderStyle = .roundedRect
        textFieldEmail.autocapitalizationType = .none // Disable autocapitalization
        textFieldEmail.autocorrectionType = .no // Disable autocorrection
        textFieldEmail.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(textFieldEmail)
    }
    
    func setupTextFieldPhoneNumber(){
        textFieldPhoneNumber = UITextField()
        textFieldPhoneNumber.placeholder = "Phone number"
        textFieldPhoneNumber.translatesAutoresizingMaskIntoConstraints = false
        textFieldPhoneNumber.borderStyle = .roundedRect
        textFieldPhoneNumber.keyboardType = .phonePad
        contentWrapper.addSubview(textFieldPhoneNumber)
    }
    
    func setupTextFieldAddress(){
        textFieldAddress = UITextField()
        textFieldAddress.placeholder = "Address"
        textFieldAddress.translatesAutoresizingMaskIntoConstraints = false
        textFieldAddress.borderStyle = .roundedRect
        contentWrapper.addSubview(textFieldAddress)
    }
    
    func setupTextFieldCity(){
        textFieldCity = UITextField()
        textFieldCity.placeholder = "City"
        textFieldCity.translatesAutoresizingMaskIntoConstraints = false
        textFieldCity.borderStyle = .roundedRect
        contentWrapper.addSubview(textFieldCity)
    }
    
    func setupTextFieldPassword(){
        textFieldPassword = UITextField()
        textFieldPassword.placeholder = "Password"
        textFieldPassword.borderStyle = .roundedRect
        textFieldPassword.isSecureTextEntry = true
        textFieldPassword.textContentType = .oneTimeCode
        textFieldPassword.translatesAutoresizingMaskIntoConstraints = false
        
        contentWrapper.addSubview(textFieldPassword)
    }
    
    func setupTextFieldPasswordRepeat(){
        textFieldPasswordRepeat = UITextField()
        textFieldPasswordRepeat.placeholder = "Repeat Password"
        textFieldPasswordRepeat.borderStyle = .roundedRect
        textFieldPasswordRepeat.isSecureTextEntry = true
        textFieldPasswordRepeat.textContentType = .oneTimeCode
        textFieldPasswordRepeat.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(textFieldPasswordRepeat)
    }
    
    func setupButtonRegister(){
        buttonRegister = UIButton(type: .system)
        buttonRegister.setTitle("Register", for: .normal)
        buttonRegister.titleLabel?.font = .boldSystemFont(ofSize: 25)
        buttonRegister.backgroundColor = .systemTeal
        buttonRegister.layer.cornerRadius = 4 // Adjust corner radius as needed
        buttonRegister.setTitleColor(.white, for: .normal)
        
        buttonRegister.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(buttonRegister)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            
            //MARK: contentWrapper constraints...
            contentWrapper.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            contentWrapper.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            contentWrapper.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            contentWrapper.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            
            textFieldName.topAnchor.constraint(equalTo: contentWrapper.topAnchor, constant: 80),
            textFieldName.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            textFieldName.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            
            textFieldEmail.topAnchor.constraint(equalTo: textFieldName.bottomAnchor, constant: 20),
            textFieldEmail.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            textFieldEmail.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            
            textFieldPhoneNumber.topAnchor.constraint(equalTo: textFieldEmail.bottomAnchor, constant: 20),
            textFieldPhoneNumber.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            textFieldPhoneNumber.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            
            textFieldAddress.topAnchor.constraint(equalTo: textFieldPhoneNumber.bottomAnchor, constant: 20),
            textFieldAddress.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            textFieldAddress.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            
            textFieldCity.topAnchor.constraint(equalTo: textFieldAddress.bottomAnchor, constant: 20),
            textFieldCity.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            textFieldCity.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            
            textFieldPassword.topAnchor.constraint(equalTo: textFieldCity.bottomAnchor, constant: 20),
            textFieldPassword.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            textFieldPassword.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            
            textFieldPasswordRepeat.topAnchor.constraint(equalTo: textFieldPassword.bottomAnchor, constant: 20),
            textFieldPasswordRepeat.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            textFieldPasswordRepeat.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            
            buttonRegister.topAnchor.constraint(equalTo: textFieldPasswordRepeat.bottomAnchor, constant: 60),
            buttonRegister.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            buttonRegister.widthAnchor.constraint(equalToConstant: 115),
            buttonRegister.bottomAnchor.constraint(equalTo: contentWrapper.bottomAnchor)
        ])
    }
    
    func setBeigeBackgroundColor(alpha: CGFloat) {
//        let red: CGFloat = 252.0/255.0
//        let green: CGFloat = 218.0/255.0
//        let blue: CGFloat = 195.0/255.0
//        let alpha: CGFloat = 0.2 // Alpha value defines transparency, 1.0 means fully opaque
//
//        let backgroundColorCode = UIColor(red: red, green: green, blue: blue, alpha: alpha)
//        self.backgroundColor = backgroundColorCode
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
