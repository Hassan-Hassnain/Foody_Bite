//
//  SettingsVC.swift
//  Foody_Bite
//
//  Created by Usama Sadiq on 3/8/20.
//  Copyright © 2020 Usama Sadiq. All rights reserved.
//

import UIKit

class SettingsVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    @IBAction func backButtonTapped(_ sender: Any) {
        dismissDetail()
    }
    @IBAction func changePasswordButtonTaped(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(identifier: "ChangePasswordVC") as? ChangePasswordVC else {return}
        vc.modalPresentationStyle = .fullScreen
        presentDetail(vc)
    }
    @IBAction func ChangeLanguageButtonTapped(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(identifier: "ChangeLanguageVC") as? ChangeLanguageVC else {return}
               vc.modalPresentationStyle = .fullScreen
               presentDetail(vc)
    }
    
    @IBAction func privacyAndPolicyButtonTapped(_ sender: Any) {
    }
    @IBAction func TermsAndConditionsButtonTapped(_ sender: Any) {
    }
    
    @IBAction func logoutButtonTapped(_ sender: Any) {
        
        CustomAlertView.instance.showAlert(alertMessage: "Are you sure you want to logout?")
        
        
    }
 
  
}
