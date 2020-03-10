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
        // create the alert
        let alert = UIAlertController(title: "", message: "", preferredStyle: UIAlertController.Style.alert)
        let color: UIColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
        let messageAttributes = [NSAttributedString.Key.font: UIFont(name: "Helvetica", size: 25)!, NSAttributedString.Key.foregroundColor: color]
        let messageString = NSAttributedString(string: "Are you sure you want to logout?", attributes: messageAttributes)
        alert.setValue(messageString, forKey: "attributedMessage")
        // add the actions (buttons)
        
        alert.addAction(UIAlertAction(title: "Continue", style: UIAlertAction.Style.default, handler: nil))
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: nil))
        alert.addAction(UIAlertAction(title: "edit", style: UIAlertAction.Style.default, handler: nil))

        // show the alert
        self.present(alert, animated: true, completion: nil)
       
        
    }
 
  
}
