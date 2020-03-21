//
//  SettingsVC.swift
//  Foody_Bite
//
//  Created by Usama Sadiq on 3/8/20.
//  Copyright © 2020 Usama Sadiq. All rights reserved.
//

import UIKit
import Dezignables
import Firebase

class SettingsVC: UIViewController {

    @IBOutlet weak var alertBG: UIView!
    @IBOutlet weak var alertOptions: DezignableView!
    @IBOutlet weak var alertOption2CenterYConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    @IBAction func backButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func changePasswordButtonTaped(_ sender: Any) {
        navigationController?.customPush(ChangePasswordVC.className, animate: true)
    }
    @IBAction func ChangeLanguageButtonTapped(_ sender: Any) {
       navigationController?.customPush(ChangeLanguageVC.className, animate: true)
    }
    
    @IBAction func privacyAndPolicyButtonTapped(_ sender: Any) {
    }
    @IBAction func TermsAndConditionsButtonTapped(_ sender: Any) {
    }
    
    @IBAction func logoutButtonTapped(_ sender: Any) {
        showAlert()
    }
 @IBAction func noButtonTapped(_ sender: Any) {
        hideAlert()
        navigationController?.popViewController(animated: true)
    }
    @IBAction func yesButtonTapped(_ sender: Any) {
        try! Auth.auth().signOut()
        hideAlert()
        navigationController?.customPush(LoginVC.className, animate: true)
    }
    //MARK: - Alert functions
    
    func hideAlert() {
        alertBG.isHidden = true
        alertOptions.isHidden = true
        alertOption2CenterYConstraint.constant = 600
    }
    
    func showAlert() {
        alertOption2CenterYConstraint.constant = 0
        alertBG.isHidden = false
        alertOptions.isHidden = false
    }
  
}
