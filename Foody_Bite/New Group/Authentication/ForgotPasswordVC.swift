//
//  ForgotPasswordVC.swift
//  Foody_Bite
//
//  Created by Usama Sadiq on 3/1/20.
//  Copyright © 2020 Usama Sadiq. All rights reserved.
//

import UIKit

class ForgotPasswordVC: UIViewController {

    @IBOutlet weak var emailTextField: DesignableUITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func sendButtonTapped(_ sender: Any) {
    }
    @IBAction func backButtonTapped(_ sender: Any) {
//        dismiss(animated: true, completion: nil)
        self.dismissDetail()
    }
    

}
