//
//  StorageServices.swift
//  Foody_Bite
//
//  Created by Usama Sadiq on 3/19/20.
//  Copyright © 2020 Usama Sadiq. All rights reserved.
//

import Foundation
import FirebaseStorage

let REF_STORAGE = Storage.storage().reference(forURL: "gs://foody-bite.appspot.com")
let REF_PROFILE_IMAGE = REF_STORAGE.child("profileImage")

class StorageServices {
    static let instance = StorageServices()
    
    func uploadImage(withUID uid: String, andImage image: UIImage, uploadCompletion: @escaping (_ url: String?)->()) {
        guard let imageData = image.jpegData(compressionQuality: 0.4) else {
            uploadCompletion(nil)
            return
        }
        let metaData = StorageMetadata()
        metaData.contentType = "image/jpg"
        REF_PROFILE_IMAGE.child(uid).putData(imageData, metadata: metaData, completion:{
            (storateMetaData, error) in
            if error != nil {
                print((error?.localizedDescription)!)
                uploadCompletion(nil)
                return
            }
            
            REF_PROFILE_IMAGE.child(uid).downloadURL { (url, error) in
                if let metaImageUrl = url?.absoluteString{
                   uploadCompletion(metaImageUrl)
                    print("Image uploading done")
                } else {
                    print("Image uploading fialed")
                }
            }
        })
    }
    
}
