//
//  LoginVC.swift
//  Foody_Bite
//
//  Created by Usama Sadiq on 2/29/20.
//  Copyright © 2020 Usama Sadiq. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var emailTextField: DesignableUITextField!
    
    @IBOutlet weak var passwordTextField: DesignableUITextField!
    @IBOutlet weak var containerView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
//        containerView.bindToKeyboard()
        
    }
    @IBAction func forgorPasswordButtonTapped(_ sender: Any) {
        guard let forgotPasswordVC = storyboard?.instantiateViewController(identifier: "ForgotPasswordVC") else {return}
        forgotPasswordVC.modalPresentationStyle = .fullScreen
//        present(forgotPasswordVC!, animated: true, completion: nil)
        self.presentDetail(forgotPasswordVC)
    }
    @IBAction func createNewAccoundButtonTapped(_ sender: Any) {
        guard let createAccountVC = storyboard?.instantiateViewController(identifier: "CreateAccountVC") else {return}
        createAccountVC.modalPresentationStyle = .fullScreen
//        present(createAccountVC, animated: true, completion: nil)
         self.presentDetail(createAccountVC)
    }
    @IBAction func loginButtonTapped(_ sender: Any) {
    }
    

}

extension LoginVC: UITextFieldDelegate {
    
}
