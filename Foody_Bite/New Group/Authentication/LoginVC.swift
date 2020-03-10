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

class LoginVC: UIViewController {

    @IBOutlet weak var emailTextField: DesignableUITextField!
    
    @IBOutlet weak var passwordTextField: DesignableUITextField!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var loginButton: DezignableButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        IQKeyboardManager.shared.keyboardDistanceFromTextField = 300
        
    }
    @IBAction func forgorPasswordButtonTapped(_ sender: Any) {
        guard let forgotPasswordVC = storyboard?.instantiateViewController(identifier: "ForgotPasswordVC") else {return}
        forgotPasswordVC.modalPresentationStyle = .fullScreen
        self.presentDetail(forgotPasswordVC)
    }
    @IBAction func createNewAccoundButtonTapped(_ sender: Any) {
        guard let createAccountVC = storyboard?.instantiateViewController(identifier: "CreateAccountVC") else {return}
        createAccountVC.modalPresentationStyle = .fullScreen
         self.presentDetail(createAccountVC)
    }
    @IBAction func loginButtonTapped(_ sender: Any) {
        guard let createAccountVC = storyboard?.instantiateViewController(identifier: "HomeVC") else {return}
                createAccountVC.modalPresentationStyle = .fullScreen
                 self.presentDetail(createAccountVC)
    }
    

}

extension LoginVC: UITextFieldDelegate {
    
}
