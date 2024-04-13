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
    var selectedOrder: UploadOrder?
    let ordersListView = OrdersListView()
    var orders = [UploadOrder]()
    
    override func loadView() {
        view = ordersListView
    }
    
    func addSupportContactForCurrentUser() {
        guard let currentUser = Auth.auth().currentUser else {
            print("Chutiye")
            return
        }
        
        // Define the support contact
        let supportContact = Contact(name: "Support", email: "support@medlivery.com", phone: 0)
        
        // Add the support contact to the current user's contacts collection
        let currentUserContactsRef = Firestore.firestore().collection("users").document(currentUser.email!).collection("support").document(supportContact.email)
        currentUserContactsRef.getDocument { (document, error) in
            guard let document = document, !document.exists else {
                // Document already exists, do not overwrite
                print("Support contact already exists for current user")
                return
            }
            
            // Document does not exist, add support contact
            currentUserContactsRef.setData(supportContact.dictionary) { error in
                if let error = error {
                    print("Error adding support contact for current user: \(error.localizedDescription)")
                } else {
                    print("Support contact added successfully for current user")
                }
            }
        }
        
        // Add the current user to the "customers" collection of the support contact
        let supportUserContactsRef = Firestore.firestore().collection("users").document("support@medlivery.com").collection("customers").document(currentUser.email!)
        supportUserContactsRef.getDocument { (document, error) in
            guard let document = document, !document.exists else {
                // Document already exists, do not overwrite
                print("Current user already exists in support contact's customers")
                return
            }
            
            // Document does not exist, add current user
            let currentUserContact = Contact(name: currentUser.displayName ?? "", email: currentUser.email ?? "", phone: 0)
            supportUserContactsRef.setData(currentUserContact.dictionary) { error in
                if let error = error {
                    print("Error adding current user to support contact's customers: \(error.localizedDescription)")
                } else {
                    let supportViewController = SupportViewController()
                    supportViewController.botSendMessage(message: "Hi! How can I help you?", senderID: "support@medlivery.com", receiverID: (self.currentUser?.email)!);
                    print("Current user added successfully to support contact's customers")
                }
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        print("View will appear called")
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
                self.addSupportContactForCurrentUser()
                //MARK: Observe Firestore database to display the contacts list...
                self.database.collection("users")
                    .document((self.currentUser?.email)!)
                    .collection("orders")
                    .addSnapshotListener(includeMetadataChanges: false, listener: {querySnapshot, error in
                        if let documents = querySnapshot?.documents{
                            self.orders.removeAll()
                            for document in documents{
                                do{
                                    let eachOrder = try document.data(as: UploadOrder.self)
                                    self.orders.append(eachOrder)
                                }catch{
                                    print(error)
                                }
                            }
                            self.orders.sort(by: {$0.currentTime < $1.currentTime})
                            self.ordersListView.tableViewOrders.reloadData()
                        }
                    })
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Orders"
        
        ordersListView.tableViewOrders.separatorStyle = .none
        ordersListView.tableViewOrders.backgroundColor = Utilities.beigeColor
        
        ordersListView.buttonAdd.addTarget(self, action: #selector(onButtonCreateOrderTapped), for: .touchUpInside)
        
//        orders.append(IndividualOrder(name: "Order_1", location: "Allston 1"))
//        orders.append(IndividualOrder(name: "Order_2", location: "Allston 2"))
//        orders.append(IndividualOrder(name: "Order_3", location: "Allston 3"))
//        orders.append(IndividualOrder(name: "Order_4", location: "Allston 4"))
        
        let logoutIcon = UIBarButtonItem(
                        image: UIImage(systemName: "rectangle.portrait.and.arrow.forward"),
                        style: .plain,
                        target: self,
                        action: #selector(logoutButtonTapped)
                    )
        
        let chatButton = UIBarButtonItem(image: UIImage(systemName: "message.badge.filled.fill"), style: .plain, target: self, action: #selector(onChatButtonTapped))
//        let powerButton = UIBarButtonItem(image: UIImage(systemName: "rectangle.portrait.and.arrow.forward"), style: .plain, target: self, action: #selector(onLogoutButtonTapped))
//        
        
//        navigationItem.rightBarButtonItems = [powerButton, profileButton]
                    
        navigationItem.rightBarButtonItems = [logoutIcon, chatButton]
        navigationController?.navigationBar.prefersLargeTitles = true
        
        ordersListView.tableViewOrders.delegate = self
        ordersListView.tableViewOrders.dataSource = self
        
        ordersListView.tableViewOrders.reloadData()
                
//        view.bringSubviewToFront(chatScreen.floatingButtonAddContact)
//        
//        chatScreen.tableViewContacts.delegate = self
//        chatScreen.tableViewContacts.dataSource = self
//        
//        //MARK: removing the separator line...
//        chatScreen.tableViewContacts.separatorStyle = .none
//        chatScreen.floatingButtonAddContact.addTarget(self, action: #selector(addContactButtonTapped), for: .touchUpInside)
    }
    
    @objc func onChatButtonTapped(){
        // Aadesh's code
        let supportViewController = SupportViewController()
        supportViewController.senderID = self.currentUser?.email
        supportViewController.receiverID = "support@medlivery.com"
        supportViewController.loadAllMessages()
        self.navigationController?.pushViewController(supportViewController, animated: true)
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
    
    @objc func onButtonCreateOrderTapped(){
//        let orderDetailsController = OrderDetailsController()
//        //orderDetailsController.currentUser = self.currentUser
//        navigationController?.pushViewController(orderDetailsController, animated: true)
        
        let createOrderController = CreateOrderController()
        createOrderController.delegate = self
        createOrderController.currentUser = self.currentUser
        //orderDetailsController.currentUser = self.currentUser
        navigationController?.pushViewController(createOrderController, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        Auth.auth().removeStateDidChangeListener(handleAuth!)
    }
    
    //MARK: got the new contacts back and delegated to ViewController...
    func delegateOnCreateOrder(uploadOrders: UploadOrder){
        
        print("Delegate called successfully")
        orders.append(uploadOrders)
        ordersListView.tableViewOrders.reloadData()
        print("Delegate emded successfully")

    }

}


extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "orders", for: indexPath) as! OrdersTableViewCell
        cell.labelName.text = orders[indexPath.row].location
        cell.labelDate.text = "\(orders[indexPath.row].currentTime)"
        return cell
    }
    
    //MARK: deal with user interaction with a cell...
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(self.orders[indexPath.row])
        onOrdersSelect(indexRow: indexPath.row, uploadOrder: self.orders[indexPath.row])

        
    }
    
    func onOrdersSelect(indexRow: Int, uploadOrder: UploadOrder) {
        let orderDetailsController = OrderDetailsController()
                
        
        
        let userData = self.database.collection("users").document((self.currentUser?.email)!)

        // Get the document snapshot
        userData.getDocument { (document, error) in
            if let error = error {
                print("Error fetching document: \(error)")
                return
            }
            
            // Check if the document exists
            guard let document = document, document.exists else {
                print("Document does not exist")
                return
            }
            
            // Access the data from the document snapshot
            if let data = document.data() {
                // Create an instance of UserInfo struct from the retrieved data
                orderDetailsController.orderDetails = IndividualOrderDetails(name: data["name"] as! String, email: self.currentUser?.email ?? "", phone: data["phone"] as! String, location: uploadOrder.location, currentDate: uploadOrder.currentTime, address: data["address"] as! String, cityState: data["city"] as! String, photoURL: uploadOrder.photoURL)
                
                self.navigationController?.pushViewController(orderDetailsController, animated: true)

            } else {
                print("Document data is empty")
            }
        }
        
        
        
        
//        let individual = IndividualOrderDetails(name: self.currentUser?.displayName, email: currentUser?.email, phone: currentUser?.phoneNumber, location: uploadOrder.location, currentDate: uploadOrder.currentTime, address: currentUser.address, cityState: <#T##String#>)
        
        
        // create object of Individual Order Details
        
//        orderDetailsController.individualOrderDetails = individualOrderDetails
//        eachController.delegate = self
        
        
    }
}


