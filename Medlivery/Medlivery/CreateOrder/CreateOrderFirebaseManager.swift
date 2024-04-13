//
//  CreateOrderFirebaseManager.swift
//  Medlivery
//
//  Created by Abhishek Kumar on 4/12/24.
//

import Foundation
import FirebaseAuth
import FirebaseStorage

extension CreateOrderController{
    
    func uploadProfilePhotoToStorage(individualOrder: IndividualOrder){
        var profilePhotoURL:URL?
        showActivityIndicator()

        //MARK: Upload the profile photo if there is any...
        if let image = pickedImage{
            if let jpegData = image.jpegData(compressionQuality: 70){
                let storageRef = storage.reference()
                let imagesRepo = storageRef.child("imagesUsers")
                let imageRef = imagesRepo.child("\(NSUUID().uuidString).jpg")
                
                let uploadTask = imageRef.putData(jpegData, completion: {(metadata, error) in
                    if error == nil{
                        imageRef.downloadURL(completion: {(url, error) in
                            if error == nil{
                                profilePhotoURL = url
                                self.storedProfilePhotoURL = profilePhotoURL
                                self.addOrderToFireStore(individualOrder: individualOrder)
//                                self.registerUser(photoURL: profilePhotoURL)
                            }
                        })
                    }
                })
            }
        }else{
            self.storedProfilePhotoURL = profilePhotoURL
            self.addOrderToFireStore(individualOrder: individualOrder)
        }
    }
}
