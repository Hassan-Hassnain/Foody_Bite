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
    
    func resetPassword(withEmail email: String, onCompletion: @escaping (_ success: Bool, _ error: String?)-> ()){
        Auth.auth().sendPasswordReset(withEmail: email) { (error) in
            if error == nil {
                onCompletion(true, FireMessages.PASSWORD_CHANGE_SUCCESSFUL)
            } else {
                onCompletion(false, error?.localizedDescription)
            }
        }
    }
    
    func changePassword(email: String, currentPassword: String, newPassword: String, onCompletion: @escaping (Bool, String?) -> Void) {
        let credential = EmailAuthProvider.credential(withEmail: email, password: currentPassword)
        Auth.auth().currentUser?.reauthenticate(with: credential, completion: { (result, error) in
            if let error = error {
                onCompletion(false, error.localizedDescription)
            } else {
                Auth.auth().currentUser?.updatePassword(to: newPassword, completion: { (error) in
                    if error != nil {
                        onCompletion(false, error?.localizedDescription)
                    } else {
                        onCompletion(true, FireMessages.PASSWORD_CHANGE_SUCCESSFUL)
                    }
                })
            }
        })
    }
    
}

