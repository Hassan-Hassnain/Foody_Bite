//
//  ForgotPasswordVC.swift
//  Foody_Bite
//
//  Created by Usama Sadiq on 3/1/20.
//  Copyright © 2020 Usama Sadiq. All rights reserved.
//

import UIKit
import ProgressHUD

class ForgotPasswordVC: UIViewController {

    @IBOutlet weak var emailTextField: DesignableUITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func sendButtonTapped(_ sender: Any) {
        emailTextField.validateField(withMessage: EMPTY_EMAIL_MESSAGE)
        AuthService.instance.resetPassword(withEmail: emailTextField.text!) { (success, message) in
            if success {
                ProgressHUD.showSuccess(message)
                DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(4), execute: {
                    self.goTo(fromStoryboar: Storyboards.signUp, toVC: "LoginVC", animate: true)
                })
                
            } else {
                ProgressHUD.showError(message)
            }
        }
    }
    @IBAction func backButtonTapped(_ sender: Any) {
        self.dismissDetail()
    }
    

}
