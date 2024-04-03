//
//  LoginViewController.swift
//  Medlivery
//
//  Created by Satvik Khetan on 4/3/24.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    let loginScreen = LoginScreenView()
    let childProgressView = ProgressSpinnerViewController()
    
    override func loadView() {
        view = loginScreen
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginScreen.buttonLogin.addTarget(self, action: #selector(onButtonLoginTapped), for: .touchUpInside)
        loginScreen.buttonRegister.addTarget(self, action: #selector(onButtonRegisterTapped), for: .touchUpInside)
    }
    
    @objc func onButtonLoginTapped(){
        var email:String = ""
        if let emailText = loginScreen.textFieldEmail.text{
            if !emailText.isEmpty{
                if (validEmail(emailText)){
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
        
        var password:String = ""
        if let passwordText = loginScreen.textFieldPassword.text{
            if !passwordText.isEmpty{
                password = passwordText
            }else{
                showEmptyFieldAlert()
                return
            }
        }
        
        login(email: email, password: password)
    }
    
    func login(email: String, password: String){
        showActivityIndicator()
        //MARK: authenticating the user...
        Auth.auth().signIn(withEmail: email, password: password, completion: {(result, error) in
            if error == nil{
                //MARK: user authenticated...
                self.hideActivityIndicator()
                print("Going to chat screen")
                self.goToChatScreen()
            }else{
                self.showInvalidCredentialsAlert()
            }
        })
    }
    
    func showEmptyFieldAlert(){
        let alert = UIAlertController(title: "Error!", message: "Fields cannot be empty!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        self.present(alert, animated: true)
    }
    
    func showInvalidEmailAlert(){
        let alert = UIAlertController(title: "Error!", message: "Email is invalid!", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        self.present(alert, animated: true)
    }
    
    func showInvalidCredentialsAlert(){
        let alert = UIAlertController(title: "Error!", message: "Invalid Credentials. Please try again!", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        self.present(alert, animated: true)
    }
    
    func validEmail(_ email: String) ->Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    @objc func onButtonRegisterTapped(){
        let registerUserViewController = RegisterUserViewController()
        navigationController?.pushViewController(registerUserViewController, animated: true)
    }
    
    func goToChatScreen(){
        let chatScreenViewController = ViewController()
        navigationController?.setViewControllers([chatScreenViewController], animated: true)
    }
}

extension LoginViewController:ProgressSpinnerDelegate{
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
