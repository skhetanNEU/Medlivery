//
//  LoginScreenView.swift
//  Medlivery
//
//  Created by Satvik Khetan on 4/3/24.
//

import UIKit

class LoginScreenView: UIView {
    
    var labelLoginRegister: UILabel!
    var textFieldEmail: UITextField!
    var textFieldPassword: UITextField!
    var buttonLogin: UIButton!
    var buttonRegister: UIButton!
    var backgroundImage: UIImageView!
    
    override init(frame: CGRect){
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setupLabelLoginRegister()
        setupTextFieldEmail()
        setupTextFieldPassword()
        setupButtonLogin()
        setupButtonRegister()
        setupBackgroundImage()
        
        initConstraints()
    }
    
    func setupLabelLoginRegister(){
        labelLoginRegister = UILabel()
        labelLoginRegister.text = "Medlivery"
        labelLoginRegister.font = UIFont.boldSystemFont(ofSize: 40)
        labelLoginRegister.textColor = .white
        labelLoginRegister.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelLoginRegister)
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
    
    func setupTextFieldPassword(){
        textFieldPassword = UITextField()
        textFieldPassword.placeholder = "Password"
        textFieldPassword.borderStyle = .roundedRect
        textFieldPassword.translatesAutoresizingMaskIntoConstraints = false
        textFieldPassword.isSecureTextEntry = true
        self.addSubview(textFieldPassword)
    }
    
    func setupButtonLogin(){
        buttonLogin = UIButton(type: .system)
        buttonLogin.setTitle("Login", for: .normal)
        buttonLogin.titleLabel?.font = .boldSystemFont(ofSize: 25)
        buttonLogin.backgroundColor = .systemTeal
        buttonLogin.layer.cornerRadius = 4 // Adjust corner radius as needed
        buttonLogin.setTitleColor(.white, for: .normal)
        buttonLogin.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonLogin)
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
    
    func setupBackgroundImage(){
        backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "login")
        backgroundImage.contentMode = .scaleAspectFill
        backgroundImage.layer.opacity = 0.4
        self.addSubview(backgroundImage)
        self.sendSubviewToBack(backgroundImage)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            
            labelLoginRegister.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 140),
            labelLoginRegister.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            textFieldEmail.topAnchor.constraint(equalTo: labelLoginRegister.bottomAnchor, constant: 30),
            textFieldEmail.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            textFieldEmail.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            textFieldPassword.topAnchor.constraint(equalTo: textFieldEmail.bottomAnchor, constant: 15),
            textFieldPassword.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            textFieldPassword.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            buttonLogin.topAnchor.constraint(equalTo: textFieldPassword.bottomAnchor, constant: 30),
            buttonLogin.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 60),
            buttonLogin.widthAnchor.constraint(equalToConstant: 85),
            
            buttonRegister.topAnchor.constraint(equalTo: textFieldPassword.bottomAnchor, constant: 30),
            buttonRegister.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -60),
            buttonRegister.widthAnchor.constraint(equalToConstant: 115)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
