//
//  ViewController.swift
//  Medlivery
//
//  Created by Satvik Khetan on 3/23/24.
//

import UIKit

class ViewController: UIViewController {
    
    let ordersListView = OrdersListView()
    
    override func loadView() {
        view = ordersListView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Orders"
        
        ordersListView.buttonAdd.addTarget(self, action: #selector(onButtonAddTapped), for: .touchUpInside)
//        let loginViewController = LoginViewController()
//        navigationController?.setViewControllers([loginViewController], animated: true)
    }
    
    
    @objc func onButtonAddTapped(){
        let orderDetailsController = OrderDetailsController()
        navigationController?.setViewControllers([orderDetailsController], animated: true)
    }
}
