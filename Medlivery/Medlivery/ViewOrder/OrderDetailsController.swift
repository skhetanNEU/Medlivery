//
//  OrderDetailsController.swift
//  Medlivery
//
//  Created by Abhishek Kumar on 4/5/24.
//

import UIKit

class OrderDetailsController: UIViewController {

    let orderDetailsView = OrderDetailsView()
    
    override func loadView() {
        view = orderDetailsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Orders Details"
        
//        let loginViewController = LoginViewController()
//        navigationController?.setViewControllers([loginViewController], animated: true)
    }

}
