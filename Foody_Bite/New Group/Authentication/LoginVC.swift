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
        goTo(toVC: "ForgotPasswordVC", animate: true)
    }
    @IBAction func createNewAccoundButtonTapped(_ sender: Any) {
        goTo(toVC: "CreateAccountVC", animate: true)
    }
    @IBAction func loginButtonTapped(_ sender: Any) {
        goTo(toVC: "HomeVC", animate: false)
    }
    

}

extension LoginVC: UITextFieldDelegate {
    
}
