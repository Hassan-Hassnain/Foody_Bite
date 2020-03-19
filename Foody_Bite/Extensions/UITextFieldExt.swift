//
//  UITextFieldExt.swift
//  Foody_Bite
//
//  Created by Usama Sadiq on 3/19/20.
//  Copyright © 2020 Usama Sadiq. All rights reserved.
//

import Foundation
import ProgressHUD

extension UITextField {
    func validateField(withMessage message: String) {
        guard !(self.text!.isEmpty) else {
            ProgressHUD.showError(message)
            return
        }
    }
}
