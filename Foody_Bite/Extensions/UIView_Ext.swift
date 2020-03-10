//
//  UIView_Ext.swift
//  Foody_Bite
//
//  Created by Usama Sadiq on 3/1/20.
//  Copyright © 2020 Usama Sadiq. All rights reserved.
//


import UIKit

extension UIView {
    func bindToKeyboardForViewFrame () {
        NotificationCenter.default.addObserver(self, selector: #selector(changeViewFrame(_:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    @objc func changeViewFrame(_ notification: NSNotification) {
        
        let duration = notification.userInfo![UIResponder.keyboardAnimationDurationUserInfoKey] as! Double
        let curve = notification.userInfo![UIResponder.keyboardAnimationCurveUserInfoKey] as! UInt
        let beginningFrame = ((notification.userInfo![UIResponder.keyboardFrameBeginUserInfoKey]) as! NSValue).cgRectValue
        let endFrame = ((notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue)
        let deltaY = endFrame.origin.y - beginningFrame.origin.y
        
        UIView.animateKeyframes(withDuration: duration, delay: 0.0, options: UIView.KeyframeAnimationOptions(rawValue: curve), animations: {
            self.frame.origin.y += deltaY
        }, completion: nil)
    }
    

    
    
}

//extension NSLayoutConstraint {
//    func bindToKeyboardForBottomConstraint () {
//        NotificationCenter.default.addObserver(self, selector: #selector(changeViewBottomConstraint(_:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
//    }
//    
//    @objc func changeViewBottomConstraint(_ notification: NSNotification) {
//        
//        let duration = notification.userInfo![UIResponder.keyboardAnimationDurationUserInfoKey] as! Double
//        let curve = notification.userInfo![UIResponder.keyboardAnimationCurveUserInfoKey] as! UInt
//        let beginningFrame = ((notification.userInfo![UIResponder.keyboardFrameBeginUserInfoKey]) as! NSValue).cgRectValue
//        let endFrame = ((notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue)
//        let deltaY = endFrame.origin.y - beginningFrame.origin.y
//        
//        UIView.animateKeyframes(withDuration: duration, delay: 0.3, options: UIView.KeyframeAnimationOptions(rawValue: curve), animations: {
//            self.constant -= deltaY
//        }, completion: nil)
//    }
//}

