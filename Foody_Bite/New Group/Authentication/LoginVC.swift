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
import ProgressHUD


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
            print("\(USER_ALREADY_SIGNED_IN) \(email)")
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
      validateFields()
        ProgressHUD.show()
        AuthService.instance.loginUser(withEmail: emailTextField.text!, andPassword: passwordTextField.text!) { (success, error) in
            if !success {
                ProgressHUD.showError(error?.localizedDescription)
            } else {
                ProgressHUD.dismiss()
                self.goTo(toVC: "HomeVC", animate: false)
            }
        }
    }
    
    func validateFields() {
        emailTextField.validateField(withMessage: EMPTY_EMAIL_MESSAGE)
        passwordTextField.validateField(withMessage: EMPTY_PASSWORD_MESSAGE)
    }
}

extension LoginVC: UITextFieldDelegate {
    
}
