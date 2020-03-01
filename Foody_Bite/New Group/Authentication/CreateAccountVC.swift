//
//  CreateAccountVC.swift
//  Foody_Bite
//
//  Created by Usama Sadiq on 3/2/20.
//  Copyright © 2020 Usama Sadiq. All rights reserved.
//

import UIKit
import Dezignables

class CreateAccountVC: UIViewController {
    
    @IBOutlet weak var profileImageView: DezignableImageView!
    @IBOutlet weak var profileAvatorImageView: UIImageView!
    @IBOutlet weak var imageUploadButton: UIButton!
    @IBOutlet weak var nameTextField: DesignableUITextField!
    @IBOutlet weak var emailTextField: DesignableUITextField!
    @IBOutlet weak var passwordTextField: DesignableUITextField!
    @IBOutlet weak var confirmPasswordTextField: DesignableUITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func imageUploadButtonTapped(_ sender: Any) {
    }
    @IBAction func registerButtonTapped(_ sender: Any) {
    }
    @IBAction func loginButtonTapped(_ sender: Any) {
        guard let  loginVC = (self.storyboard?.instantiateViewController(identifier: "LoginVC") as? LoginVC) else {return}
        loginVC.modalPresentationStyle = .fullScreen
        self.dismissDetail()  }
    
    
}
