//
//  RegisterUserView.swift
//  Medlivery
//
//  Created by Satvik Khetan on 4/3/24.
//

import UIKit

class RegisterUserView: UIView {
    
    var textFieldName: UITextField!
    var textFieldEmail: UITextField!
    var textFieldPhoneNumber: UITextField!
    var textFieldPassword: UITextField!
    var textFieldPasswordRepeat: UITextField!
    var buttonRegister: UIButton!
    
    
    
    override init(frame: CGRect){
        super.init(frame: frame)
        //self.backgroundColor = .systemMint
        
        self.backgroundColor = Utilities.beigeColor
        
        setupTextFieldName()
        setupTextFieldEmail()
        setupTextFieldPhoneNumber()
        setupTextFieldPassword()
        setupTextFieldPasswordRepeat()
        setupButtonRegister()
        
        initConstraints()
    }
    
    func setupTextFieldName(){
        textFieldName = UITextField()
        textFieldName.placeholder = "Name"
        textFieldName.borderStyle = .roundedRect
        textFieldName.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldName)
    }
    
    func setupTextFieldEmail(){
        textFieldEmail = UITextField()
        textFieldEmail.placeholder = "Email"
        textFieldEmail.borderStyle = .roundedRect
        textFieldEmail.autocapitalizationType = .none // Disable autocapitalization
        textFieldEmail.autocorrectionType = .no // Disable autocorrection
        textFieldEmail.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldEmail)
    }
    
    func setupTextFieldPhoneNumber(){
        textFieldPhoneNumber = UITextField()
        textFieldPhoneNumber.placeholder = "Phone number"
        textFieldPhoneNumber.translatesAutoresizingMaskIntoConstraints = false
        textFieldPhoneNumber.borderStyle = .roundedRect
        textFieldPhoneNumber.keyboardType = .phonePad
        self.addSubview(textFieldPhoneNumber)
    }
    
    func setupTextFieldPassword(){
        textFieldPassword = UITextField()
        textFieldPassword.placeholder = "Password"
        textFieldPassword.borderStyle = .roundedRect
        textFieldPassword.translatesAutoresizingMaskIntoConstraints = false
        textFieldPassword.isSecureTextEntry = true
        self.addSubview(textFieldPassword)
    }
    
    func setupTextFieldPasswordRepeat(){
        textFieldPasswordRepeat = UITextField()
        textFieldPasswordRepeat.placeholder = "Repeat Password"
        textFieldPasswordRepeat.borderStyle = .roundedRect
        textFieldPasswordRepeat.translatesAutoresizingMaskIntoConstraints = false
        textFieldPasswordRepeat.isSecureTextEntry = true
        self.addSubview(textFieldPasswordRepeat)
    }
    
    func setupButtonRegister(){
        buttonRegister = UIButton(type: .system)
        buttonRegister.setTitle("Register", for: .normal)
        buttonRegister.titleLabel?.font = .boldSystemFont(ofSize: 25)
        buttonRegister.backgroundColor = .systemTeal
        buttonRegister.layer.cornerRadius = 4 // Adjust corner radius as needed
        buttonRegister.setTitleColor(.white, for: .normal)
        
        buttonRegister.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonRegister)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            
            textFieldName.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 80),
            textFieldName.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            textFieldName.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            
            textFieldEmail.topAnchor.constraint(equalTo: textFieldName.bottomAnchor, constant: 20),
            textFieldEmail.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            textFieldEmail.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            
            textFieldPhoneNumber.topAnchor.constraint(equalTo: textFieldName.bottomAnchor, constant: 20),
            textFieldPhoneNumber.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            textFieldPhoneNumber.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            
            textFieldPassword.topAnchor.constraint(equalTo: textFieldPhoneNumber.bottomAnchor, constant: 20),
            textFieldPassword.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            textFieldPassword.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            
            textFieldPasswordRepeat.topAnchor.constraint(equalTo: textFieldPassword.bottomAnchor, constant: 20),
            textFieldPasswordRepeat.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            textFieldPasswordRepeat.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            
            
            buttonRegister.topAnchor.constraint(equalTo: textFieldPasswordRepeat.bottomAnchor, constant: 60),
            buttonRegister.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            buttonRegister.widthAnchor.constraint(equalToConstant: 115)
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
