//
//  AuthService.swift
//  Foody_Bite
//
//  Created by Usama Sadiq on 3/16/20.
//  Copyright © 2020 Usama Sadiq. All rights reserved.
//

import Foundation
import Firebase
import FirebaseStorage

class AuthService {
    static let instance = AuthService()

    func createUser(withEmail email: String, andPassword passowrd: String, registrationCompletion: @escaping (_ user: User?) -> ()) {
        Auth.auth().createUser(withEmail: email, password: passowrd) { (authResult, error) in
            guard let user = authResult?.user , error == nil else { registrationCompletion(nil); return}
            registrationCompletion(user)
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

