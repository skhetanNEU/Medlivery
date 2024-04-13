//
//  OrderDetailsController.swift
//  Medlivery
//
//  Created by Abhishek Kumar on 4/5/24.
//

import UIKit

class OrderDetailsController: UIViewController {

    let orderDetailsView = OrderDetailsView()
    
    var orderDetails: IndividualOrderDetails?
    
    override func loadView() {
        view = orderDetailsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        title = "Orders Details"
                
//        let loginViewController = LoginViewController()
//        navigationController?.setViewControllers([loginViewController], animated: true)
        
        if let unwrappedName = orderDetails?.name{
            
            orderDetailsView.labelName.text = unwrappedName
            
        }
        
        if let unwrappedEmail = orderDetails?.email{
            
            orderDetailsView.labelEmail.text = unwrappedEmail
            
        }
        
        if let unwrappedPhone = orderDetails?.phone{
            
            orderDetailsView.labelPhone.text = unwrappedPhone
            
        }
        
        if let unwrappedLocation = orderDetails?.location{
            
            orderDetailsView.storeLocation.text = unwrappedLocation
            
        }
        if let unwrappedDate = orderDetails?.currentDate{
            
            orderDetailsView.dateOfOrder.text = unwrappedDate
            
        }
        
        if let unwrappedAddress = orderDetails?.address{
            
            orderDetailsView.labelAddress.text = unwrappedAddress
            
        }
        
        if let unwrappedCity = orderDetails?.cityState{
            
            orderDetailsView.labelCityState.text = unwrappedCity
            
        }
        
        if let unwrappedPhotoURL = orderDetails?.photoURL{
            
//            orderDetailsView.labelCityState.text = unwrappedPhotoURL
            
            print(unwrappedPhotoURL)
            self.orderDetailsView.imagePrescription.loadRemoteImage(from: unwrappedPhotoURL)
            
        }
        
//
    }

}
