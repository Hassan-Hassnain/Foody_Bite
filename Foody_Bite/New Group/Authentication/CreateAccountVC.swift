//
//  CreateAccountVC.swift
//  Foody_Bite
//
//  Created by Usama Sadiq on 3/2/20.
//  Copyright © 2020 Usama Sadiq. All rights reserved.
//

import UIKit
import Dezignables
import IQKeyboardManagerSwift

class CreateAccountVC: UIViewController {
    
    @IBOutlet weak var profileImageView: DezignableImageView!
    @IBOutlet weak var profileAvatorImageView: UIImageView!
    @IBOutlet weak var imageUploadButton: UIButton!
    @IBOutlet weak var nameTextField: DesignableUITextField!
    @IBOutlet weak var emailTextField: DesignableUITextField!
    @IBOutlet weak var passwordTextField: DesignableUITextField!
    @IBOutlet weak var confirmPasswordTextField: DesignableUITextField!
    @IBOutlet weak var registerButton: DezignableButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
        confirmPasswordTextField.delegate = self
        
        IQKeyboardManager.shared.keyboardDistanceFromTextField = 200
        
    }
    
    @IBAction func imageUploadButtonTapped(_ sender: Any) {
    }
    @IBAction func registerButtonTapped(_ sender: Any) {
        if  let name = nameTextField.text,
            let email = emailTextField.text,
            let password = passwordTextField.text {
            if password == confirmPasswordTextField.text {
                registerNewUser(withName: name, withEmail: email, andPassword: password) { (success) in
                    if success {
                        print("User Register Successfully")
                        let vc = self.storyboard?.instantiateViewController(identifier: "LoginVC") as? LoginVC
                        vc?.email = email
                        vc?.password = password
                        self.goTo(toVC: "LoginVC", animate: true)
                    } else {
                        print("User can not be Registered ")
                    }
                }
            }
        }
    }
    @IBAction func loginButtonTapped(_ sender: Any) {
        goTo(toVC: "LoginVC", animate: true)
    }
}

extension CreateAccountVC : UITextFieldDelegate {
    
}


extension CreateAccountVC {
    
    func registerNewUser(withName name: String, withEmail email: String, andPassword password: String, onCompletion: @escaping (_ success: Bool) -> ()){
        AuthService.instance.registerUser(withName: name, andEmail: email, andPassword: password) { (success, registerationError) in
            if success {
                print("User registered successfully")
                onCompletion(true)
            } else {
                debugPrint(registerationError!)
                onCompletion(false)
            }
        }
    }
    
}
