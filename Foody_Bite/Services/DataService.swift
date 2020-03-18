//
//  DataService.swift
//  Foody_Bite
//
//  Created by Usama Sadiq on 3/15/20.
//  Copyright © 2020 Usama Sadiq. All rights reserved.
//

import Foundation
import Firebase
import FirebaseStorage

let DB_BASE = Database.database().reference()

class DataService {
    static let instance = DataService()
    
    private var _REF_BASE = DB_BASE
    private var _REF_USERS = DB_BASE.child("users")
    private var _REF_GROUPS = DB_BASE.child("groups")
    private var _REF_FEED = DB_BASE.child("feed")
    private var _REF_STORAGE = Storage.storage().reference(forURL: "gs://foody-bite.appspot.com")
    
    
    var REF_BASE: DatabaseReference {
        return _REF_BASE
    }
    
    var REF_USERS: DatabaseReference {
        return _REF_USERS
    }
    
    var REF_GROUPS: DatabaseReference {
        return _REF_GROUPS
    }
    
    var REF_FEED: DatabaseReference {
        return _REF_FEED
    }
    
    var REF_STORAGE: StorageReference {
        return _REF_STORAGE
    }
    
    
    
    func createDBUser(uid: String, userData: Dictionary<String, Any>) {
        REF_USERS.child(uid).updateChildValues(userData, withCompletionBlock: {
            (error, ref) in
            if error == nil {
                print("Done")
            }
        })
    }
    

    
    private (set) var categores:[String] = ["Italian","Chinese","Maxican","Thai","Arabian","Indian","American","Korean","European"]
    
    
    
    
    
}
