//
//  CreateOrderController.swift
//  Medlivery
//
//  Created by Abhishek Kumar on 4/5/24.
//

import UIKit

class CreateOrderController: UIViewController {

    
    let createOrderView = CreateOrderView()
    
    override func loadView() {
        view = createOrderView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
