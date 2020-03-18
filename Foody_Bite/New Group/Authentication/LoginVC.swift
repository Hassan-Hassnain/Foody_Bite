//
//  LoginVC.swift
//  Foody_Bite
//
//  Created by Usama Sadiq on 2/29/20.
//  Copyright © 2020 Usama Sadiq. All rights reserved.
//

import UIKit
import Dezignables
import IQKeyboardManagerSwift
import Firebase

class LoginVC: UIViewController {

    @IBOutlet weak var emailTextField: DesignableUITextField!
    
    @IBOutlet weak var passwordTextField: DesignableUITextField!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var loginButton: DezignableButton!
    
    var email = ""
    var password = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        IQKeyboardManager.shared.keyboardDistanceFromTextField = 300
        
        
        emailTextField.text = email
        passwordTextField.text = password
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let email = Auth.auth().currentUser?.email {
            print("user allready signed in with \(email)")
        } else {
            print("No user signed in")
        }
    }
    @IBAction func forgorPasswordButtonTapped(_ sender: Any) {
        goTo(toVC: "ForgotPasswordVC", animate: true)
    }
    @IBAction func createNewAccoundButtonTapped(_ sender: Any) {
        goTo(toVC: "CreateAccountVC", animate: true)
    }
    @IBAction func loginButtonTapped(_ sender: Any) {
        guard let email = emailTextField.text, let password = passwordTextField.text else { return }
        loginUser(withEmail: email, andPassword: password) { (success) in
            if success {
                print("User signed in successfully")
                self.goTo(toVC: "HomeVC", animate: true)
            } else {
                print("User login failed")
            }
        }
    }
    

}

extension LoginVC: UITextFieldDelegate {
    
}

extension LoginVC {
  
    
    func loginUser(withEmail email: String, andPassword password: String, onCompletion: @escaping (_ success: Bool) -> ()) {
        AuthService.instance.loginUser(withEmail: email, andPassword: password) { (success, loginError) in
            if success {
                print("User signed in successfully with email \(Auth.auth().currentUser!)")
                onCompletion(true)
            }else{
                print("No user exist with email \(email)")
                onCompletion(false)
            }
            
        }
    }
    
    
}
