//
//  ChangePasswordVC.swift
//  Foody_Bite
//
//  Created by Usama Sadiq on 3/9/20.
//  Copyright © 2020 Usama Sadiq. All rights reserved.
//

import UIKit
import Dezignables
class ChangePasswordVC: UIViewController {
    
    @IBOutlet weak var currentPasswordTextField: DesignableUITextField!
    @IBOutlet weak var newPasswordTextField: DesignableUITextField!
    @IBOutlet weak var confirmPasswordTextField: DesignableUITextField!
    @IBOutlet weak var updateButton: DezignableButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentPasswordTextField.delegate = self
        newPasswordTextField.delegate = self
        confirmPasswordTextField.delegate = self
        
    }
    
    
    @IBAction func backButtonTapped(_ sender: Any) {
        dismissDetail()
    }
    @IBAction func updateButtonTapped(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(identifier: "LoginVC") as? LoginVC else {return}
        vc.modalPresentationStyle = .fullScreen
        presentDetail(vc)
        
    }
    
    
}
extension ChangePasswordVC: UITextFieldDelegate {
   
   
   
    
    
}
