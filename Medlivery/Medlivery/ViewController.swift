//
//  ViewController.swift
//  Medlivery
//
//  Created by Satvik Khetan on 3/23/24.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let loginViewController = LoginViewController()
        navigationController?.setViewControllers([loginViewController], animated: true)
    }


}

