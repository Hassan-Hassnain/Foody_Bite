//
//  ChangePasswordVC.swift
//  Foody_Bite
//
//  Created by Usama Sadiq on 3/9/20.
//  Copyright © 2020 Usama Sadiq. All rights reserved.
//

import UIKit
import Firebase
import ProgressHUD

class ChangePasswordVC: UIViewController {
    
    @IBOutlet weak var currentPasswordTextField: Custom_UITextField!
    @IBOutlet weak var newPasswordTextField: Custom_UITextField!
    @IBOutlet weak var confirmPasswordTextField: Custom_UITextField!
    @IBOutlet weak var updateButton: Custom_UIButton!
    @IBOutlet weak var updateButtonBottonConstraint: NSLayoutConstraint!
    
    var keyboardIsUp = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentPasswordTextField.delegate = self
        newPasswordTextField.delegate = self
        confirmPasswordTextField.delegate = self
        
        bindToKeyboardForBottomConstraint()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
    }
    
    
    
    @IBAction func backButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func updateButtonTapped(_ sender: Any) {
        //Testing pending
        currentPasswordTextField.validateField(withMessage: FieldValid.EMPTY_PASSWORD)
        newPasswordTextField.validateField(withMessage: FieldValid.EMPTY_NEW_PASSWORD)
        confirmPasswordTextField.validateField(withMessage: FieldValid.EMPTY_CONFIRM_PASSWORD)
        let email = Auth.auth().currentUser?.email
        if newPasswordTextField.text == confirmPasswordTextField.text {
            AuthService.instance.changePassword(email: email!, currentPassword: currentPasswordTextField.text!, newPassword: newPasswordTextField.text!) { (success, message) in
                if success {
                    ProgressHUD.showSuccess(message)
                    DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(4), execute: {
                        self.navigationController?.popViewController(animated: true)
                    })
                } else {
                    ProgressHUD.showError(message)
                }
            }
        } else {
            ProgressHUD.showError(FieldValid.PASSWORD_NOT_MATCH)
        }
        
        
        navigationController?.customPush(LoginVC.className, animate: true)
        
    }
    
    
    
    
}
extension ChangePasswordVC: UITextFieldDelegate {}

extension ChangePasswordVC {
    func bindToKeyboardForBottomConstraint () {
        NotificationCenter.default.addObserver(self, selector: #selector(changeViewBottomConstraint(_:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    @objc func changeViewBottomConstraint(_ notification: NSNotification) {
        
        let duration = notification.userInfo![UIResponder.keyboardAnimationDurationUserInfoKey] as! Double
        let curve = notification.userInfo![UIResponder.keyboardAnimationCurveUserInfoKey] as! UInt
        let beginningFrame = ((notification.userInfo![UIResponder.keyboardFrameBeginUserInfoKey]) as! NSValue).cgRectValue
        let endFrame = ((notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue)
        let deltaY = endFrame.origin.y - beginningFrame.origin.y
        
        UIView.animateKeyframes(withDuration: duration, delay: 0.0, options: UIView.KeyframeAnimationOptions(rawValue: curve), animations: {
            self.updateButtonBottonConstraint.constant -= deltaY
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
}

