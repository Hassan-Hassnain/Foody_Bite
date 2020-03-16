//
//  AuthService.swift
//  Foody_Bite
//
//  Created by Usama Sadiq on 3/16/20.
//  Copyright © 2020 Usama Sadiq. All rights reserved.
//

import Foundation
import Firebase

class AuthService {
    static let instance = AuthService()
    
    func registerUser(withName name: String, andEmail email: String, andPassword password: String, userCreationCompletion: @escaping (_ status: Bool, _ error: Error?) -> ()) {
        Auth.auth().createUser(withEmail: email, password: password) { (AuthResult, error) in
            
            guard let user = AuthResult?.user, error == nil else { userCreationCompletion(false, error)
                return
            }
            
            let userData = ["name": user.displayName, "provider": user.providerID, "email": user.email]
            DataService.instance.createDBUser(uid: user.uid, userData: userData as Dictionary<String, Any>)
            userCreationCompletion(true, nil)
        }
    }
    
    func loginUser(withEmail email: String, andPassword password: String, loginComplete: @escaping (_ status: Bool, _ error: Error? ) -> ()) {
        Auth.auth().signIn(withEmail: email, password: password) { (AuthResult, error) in
            if error != nil {
                loginComplete(false, error!)
                return
            }
            loginComplete(true, nil)
        }
    }
    
    
}

