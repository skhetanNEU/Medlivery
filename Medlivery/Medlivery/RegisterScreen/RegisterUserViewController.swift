//
//  RegisterUserViewController.swift
//  Medlivery
//
//  Created by Satvik Khetan on 4/3/24.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class RegisterUserViewController: UIViewController {

    let registerScreen = RegisterUserView()
    let childProgressView = ProgressSpinnerViewController()
    private var tapGesture: UITapGestureRecognizer?
    
    override func loadView() {
        view = registerScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Register User"
        
        registerScreen.buttonRegister.addTarget(self, action: #selector(onRegisterButtonTapped), for: .touchUpInside)
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboardOnTap))
        tapRecognizer.cancelsTouchesInView = false
        view.addGestureRecognizer(tapRecognizer)
    }
    
    @objc func hideKeyboardOnTap(){
        //MARK: removing the keyboard from screen...
        view.endEditing(true)
    }
    
    @objc func onRegisterButtonTapped(){
        var name:String = ""
        if let nameText = registerScreen.textFieldName.text{
            if !nameText.isEmpty{
                name = nameText
            }else{
                showEmptyFieldAlert()
                return
            }
        }
        
        var email:String = ""
        if let emailText = registerScreen.textFieldEmail.text{
            if !emailText.isEmpty{
                if (Utilities.validEmail(emailText)){
                    // Check if email contains any uppercase letters
                    if emailText != emailText.lowercased() {
                        showInvalidEmailAlert()
                        return
                    }
                    if(emailText == "support@medlivery.com"){
                        showRestrictedEmailAlert()
                    }
                    email = emailText
                }
                else{
                    showInvalidEmailAlert()
                }
            }else{
                showEmptyFieldAlert()
                return
            }
        }
        
        var phoneNumber:String = ""
        if let phoneNumberText = registerScreen.textFieldPhoneNumber.text{
            if !phoneNumberText.isEmpty{
                if(Utilities.validPhoneNumber(phoneNumberText)){
                    phoneNumber = phoneNumberText
                }
                else{
                    showInvalidPhoneNumberAlert()
                    return
                }
            }else{
                showEmptyFieldAlert()
                return
            }
        }
        
        var address:String = ""
        if let addressText = registerScreen.textFieldAddress.text{
            if !addressText.isEmpty{
                address = addressText
            }else{
                showEmptyFieldAlert()
                return
            }
        }
        
        var city:String = ""
        if let cityText = registerScreen.textFieldCity.text{
            if !cityText.isEmpty{
                city = cityText
            }else{
                showEmptyFieldAlert()
                return
            }
        }
        
        var password:String = ""
        if let passwordText = registerScreen.textFieldPassword.text,
           let passwordRepeatText = registerScreen.textFieldPasswordRepeat.text{
            if !passwordText.isEmpty{
                if(passwordText.count > 5){
                    if !passwordRepeatText.isEmpty {
                        if passwordText == passwordRepeatText{
                            password = passwordText
                        }
                        else{
                            showPasswordMismatchAlert()
                            return
                        }
                    }
                    else{
                        showEmptyFieldAlert()
                        return
                    }
                }
                else{
                    showInvalidPasswordLengthAlert()
                }
            }else{
                showEmptyFieldAlert()
                return
            }
        }
        
        register(name:name, email:email, phoneNumber: phoneNumber, address: address, city: city, password: password)
    }
    
    func register(name:String, email:String, phoneNumber:String, address:String, city:String, password:String){
        showActivityIndicator()
        Auth.auth().createUser(withEmail: email, password: password, completion: {result, error in
            if error == nil{
                //MARK: the user creation is successful...
                self.addProfileInFirebase(name: name, email:email, phone:phoneNumber, address:address, city:city)
            }else{
                //MARK: there is a error creating the user...
                self.hideActivityIndicator()
                self.showUserExistsAlert()
            }
        })
    }
    
    //MARK: We set the name of the user after we create the account...
    func addProfileInFirebase(name: String, email:String, phone:String, address:String, city:String){
        let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
        changeRequest?.displayName = name
        changeRequest?.commitChanges(completion: {(error) in
            if error == nil{
                //MARK: the profile update is successful...
                self.addProfileDetails(name: name, email:email, phone: phone, address: address, city: city)
            }else{
                //MARK: there was an error updating the profile...
                self.hideActivityIndicator()
            }
        })
    }
    
    func addProfileDetails(name: String, email:String, phone:String, address:String, city:String){
        let db = Firestore.firestore()

        let profileData: [String: Any] = [
            "name": name,
            "phone": phone,
            "address": address,
            "city": city
        ]

        db.collection("users").document(email).setData(profileData) { error in
            if let error = error {
                print("Error adding profile: \(error)")
            } else {
                print("Profile added successfully")
            }
        }
        
        self.hideActivityIndicator()
        self.goToOrdersScreen()
    }
    
    func goToOrdersScreen(){
        let orderScreenViewController = ViewController()
        navigationController?.setViewControllers([orderScreenViewController], animated: true)
    }
    
    func showEmptyFieldAlert(){
        let alert = UIAlertController(title: "Error!", message: "Fields cannot be empty!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        self.present(alert, animated: true)
    }
    
    func showInvalidPasswordLengthAlert(){
        let alert = UIAlertController(title: "Error!", message: "Password cannot be less than 6 characters", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        self.present(alert, animated: true)
    }
    
    func showPasswordMismatchAlert(){
        let alert = UIAlertController(title: "Error!", message: "Passwords do not match!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        self.present(alert, animated: true)
    }
    
    func showInvalidEmailAlert(){
        let alert = UIAlertController(title: "Error!", message: "Email is invalid or contains uppercase letters!!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
    
    func showRestrictedEmailAlert(){
        let alert = UIAlertController(title: "Error!", message: "This email is restricted", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
    
    func showInvalidPhoneNumberAlert(){
        let alert = UIAlertController(title: "Error!", message: "Phone number is invalid!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
    
    func showUserExistsAlert(){
        let alert = UIAlertController(title: "Error!", message: "User already exists", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default)) 
        self.present(alert, animated: true)
    }
}


extension RegisterUserViewController:ProgressSpinnerDelegate{
    func showActivityIndicator(){
        addChild(childProgressView)
        view.addSubview(childProgressView.view)
        childProgressView.didMove(toParent: self)
    }
    
    func hideActivityIndicator(){
        childProgressView.willMove(toParent: nil)
        childProgressView.view.removeFromSuperview()
        childProgressView.removeFromParent()
    }
}

