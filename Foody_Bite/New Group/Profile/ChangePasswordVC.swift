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
    @IBOutlet weak var updateButtonBottonConstraint: NSLayoutConstraint!
    
    var keyboardIsUp = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentPasswordTextField.delegate = self
        newPasswordTextField.delegate = self
        confirmPasswordTextField.delegate = self
        
        bindToKeyboardForBottomConstraint()
    }
    
    
    @IBAction func backButtonTapped(_ sender: Any) {
        dismissDetail()
    }
    @IBAction func updateButtonTapped(_ sender: Any) {
        goTo(toVC: "LoginVC", animate: true)
        
    }
    
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
extension ChangePasswordVC: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    
    
}
