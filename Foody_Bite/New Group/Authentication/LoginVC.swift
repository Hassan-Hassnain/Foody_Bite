//
//  LoginVC.swift
//  Foody_Bite
//
//  Created by Usama Sadiq on 2/29/20.
//  Copyright © 2020 Usama Sadiq. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift
import Firebase
import ProgressHUD


class LoginVC: UIViewController {
    
    @IBOutlet weak var emailTextField: Custom_UITextField!
    
    @IBOutlet weak var passwordTextField: Custom_UITextField!
    @IBOutlet weak var loginButton: Custom_UIButton!
    
    var email = ""
    var password = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        IQKeyboardManager.shared.keyboardDistanceFromTextField = 300
        emailTextField.text = email
        passwordTextField.text = password
        self.tabBarController?.tabBar.isHidden = true
        navigationController?.navigationBar.isHidden = true
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let email = Auth.auth().currentUser?.email {
            print("\(FireMessages.USER_ALREADY_SIGNED_IN) \(email)")
        }
    }
    @IBAction func forgorPasswordButtonTapped(_ sender: Any) {
        navigationController?.customPush(ForgotPasswordVC.className, animate: true)
    }
    @IBAction func createNewAccoundButtonTapped(_ sender: Any) {
        navigationController?.customPush(CreateAccountVC.className, animate: true)
    }
    @IBAction func loginButtonTapped(_ sender: Any) {
      validateFields()
        ProgressHUD.show()
        AuthService.instance.loginUser(withEmail: emailTextField.text!, andPassword: passwordTextField.text!) { (success, error) in
            if !success {
                ProgressHUD.showError(error?.localizedDescription)
                print("Login Failed!")
            } else {
                ProgressHUD.dismiss()
                let homeVC = Storyboards.main.instantiateViewController(identifier: HomeVC.className)
                self.navigationController?.pushViewController(homeVC, animated:  true)
//                self.navigationController?.customPush(HomeVC.className, animate: false)
                print("Login Success!")
            }
        }
    }
    
    func validateFields() {
        emailTextField.validateField(withMessage: FieldValid.EMPTY_EMAIL)
        passwordTextField.validateField(withMessage: FieldValid.EMPTY_PASSWORD)
    }
}

extension LoginVC: UITextFieldDelegate {
    
}
