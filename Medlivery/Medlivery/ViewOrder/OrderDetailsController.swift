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
        
        if let unwrappedName = orderDetails?.name{
            orderDetailsView.labelName.text = unwrappedName
        }
        
        if let unwrappedEmail = orderDetails?.email{
            orderDetailsView.labelEmail.text = unwrappedEmail
        }
        
        if let unwrappedPhone = orderDetails?.phone{
            orderDetailsView.labelPhone.text = unwrappedPhone
        }
        
        if let unwrappedStoreName = orderDetails?.storeName{
            orderDetailsView.storeName.text = unwrappedStoreName
        }
        
        if let unwrappedStoreAdd = orderDetails?.storeAddress{
            orderDetailsView.storeAddress.text = unwrappedStoreAdd
        }
        
        if let unwrappedStoreCity = orderDetails?.storeCityState{
            orderDetailsView.storeCityState.text = unwrappedStoreCity
        }
        
        if let unwrappedStoreZip = orderDetails?.storeZip{
            orderDetailsView.storeZip.text = unwrappedStoreZip
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
            self.orderDetailsView.imagePrescription.loadRemoteImage(from: unwrappedPhotoURL)
        }
    }
}
