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
    
    override init(frame: CGRect){
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setupLabelLoginRegister()
        setupTextFieldEmail()
        setupTextFieldPassword()
        setupButtonLogin()
        setupButtonRegister()
        
        initConstraints()
    }
    
    func setupLabelLoginRegister(){
        labelLoginRegister = UILabel()
        labelLoginRegister.text = "Login/Register"
        labelLoginRegister.font = UIFont.boldSystemFont(ofSize: 20)
        labelLoginRegister.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelLoginRegister)
    }
    
    func setupTextFieldEmail(){
        textFieldEmail = UITextField()
        textFieldEmail.placeholder = "Email"
        textFieldEmail.borderStyle = .roundedRect
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
        buttonLogin.titleLabel?.font = .boldSystemFont(ofSize: 18)
        buttonLogin.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonLogin)
    }
    
    func setupButtonRegister(){
        buttonRegister = UIButton(type: .system)
        buttonRegister.setTitle("Register", for: .normal)
        buttonRegister.titleLabel?.font = .boldSystemFont(ofSize: 18)
        buttonRegister.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonRegister)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            
            labelLoginRegister.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 40),
            labelLoginRegister.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            textFieldEmail.topAnchor.constraint(equalTo: labelLoginRegister.bottomAnchor, constant: 30),
            textFieldEmail.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            textFieldEmail.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            
            textFieldPassword.topAnchor.constraint(equalTo: textFieldEmail.bottomAnchor, constant: 15),
            textFieldPassword.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            textFieldPassword.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            
            buttonLogin.topAnchor.constraint(equalTo: textFieldPassword.bottomAnchor, constant: 30),
            buttonLogin.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            
            buttonRegister.topAnchor.constraint(equalTo: textFieldPassword.bottomAnchor, constant: 30),
            buttonRegister.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -40),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
