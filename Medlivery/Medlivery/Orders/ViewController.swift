//
//  ViewController.swift
//  Medlivery
//
//  Created by Satvik Khetan on 3/23/24.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class ViewController: UIViewController {
    var currentUser:FirebaseAuth.User?
    let database = Firestore.firestore()
    var handleAuth: AuthStateDidChangeListenerHandle?
    
    let ordersListView = OrdersListView()
    
    override func loadView() {
        view = ordersListView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //MARK: handling if the Authentication state is changed (sign in, sign out, register)...
        handleAuth = Auth.auth().addStateDidChangeListener{ auth, user in
            if user == nil{
                self.currentUser = nil
                print("Not logged")
                self.goToLoginScreen()
            }else{
                print("Logged in already")
                self.currentUser = user
                //MARK: Observe Firestore database to display the contacts list...
//                self.chatScreen.labelText.text = "Welcome \(user?.displayName ?? "Anonymous")!"
//                self.database.collection("users")
//                    .document((self.currentUser?.email)!)
//                    .collection("contacts")
//                    .addSnapshotListener(includeMetadataChanges: false, listener: {querySnapshot, error in
//                        if let documents = querySnapshot?.documents{
//                            self.contactsList.removeAll()
//                            for document in documents{
//                                do{
//                                    let contact  = try document.data(as: Contact.self)
//                                    self.contactsList.append(contact)
//                                }catch{
//                                    print(error)
//                                }
//                            }
//                            self.contactsList.sort(by: {$0.name < $1.name})
//                            self.chatScreen.tableViewContacts.reloadData()
//                        }
//                    })
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Orders"
        
        ordersListView.buttonAdd.addTarget(self, action: #selector(onButtonAddTapped), for: .touchUpInside)
        
        let logoutIcon = UIBarButtonItem(
                        image: UIImage(systemName: "rectangle.portrait.and.arrow.forward"),
                        style: .plain,
                        target: self,
                        action: #selector(logoutButtonTapped)
                    )
                    
        navigationItem.rightBarButtonItems = [logoutIcon]
        navigationController?.navigationBar.prefersLargeTitles = true
                
//        view.bringSubviewToFront(chatScreen.floatingButtonAddContact)
//        
//        chatScreen.tableViewContacts.delegate = self
//        chatScreen.tableViewContacts.dataSource = self
//        
//        //MARK: removing the separator line...
//        chatScreen.tableViewContacts.separatorStyle = .none
//        chatScreen.floatingButtonAddContact.addTarget(self, action: #selector(addContactButtonTapped), for: .touchUpInside)
    }
    
    @objc func logoutButtonTapped(){
        let logoutAlert = UIAlertController(title: "Logging out!", message: "Are you sure want to log out?",
            preferredStyle: .actionSheet)
        logoutAlert.addAction(UIAlertAction(title: "Yes, log out!", style: .default, handler: {(_) in
                do{
                    try Auth.auth().signOut()
                }catch{
                    print("Error occured!")
                }
                let loginScreenViewController = LoginViewController()
                self.navigationController?.setViewControllers([loginScreenViewController], animated: true)
            })
        )
        logoutAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        self.present(logoutAlert, animated: true)
    }
    
    func goToLoginScreen(){
        let loginViewController = LoginViewController()
        navigationController?.setViewControllers([loginViewController], animated: true)
    }
    
    @objc func onButtonAddTapped(){
        let orderDetailsController = OrderDetailsController()
        //orderDetailsController.currentUser = self.currentUser
        navigationController?.pushViewController(orderDetailsController, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        Auth.auth().removeStateDidChangeListener(handleAuth!)
    }

}
