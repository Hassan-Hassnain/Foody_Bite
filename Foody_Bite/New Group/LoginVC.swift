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
        let forgotPasswordVC = storyboard?.instantiateViewController(identifier: "ForgotPasswordVC")
        forgotPasswordVC?.modalPresentationStyle = .fullScreen
        present(forgotPasswordVC!, animated: true, completion: nil)
    }
    @IBAction func createNewAccoundButtonTapped(_ sender: Any) {
    }
    @IBAction func loginButtonTapped(_ sender: Any) {
    }
    

}

extension LoginVC: UITextFieldDelegate {
    
}
