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
    
    
    func applyGradient(startColor: UIColor, stopColor: UIColor)  {
        let gradient = CAGradientLayer()
        gradient.colors = [startColor.cgColor, stopColor.cgColor]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.0)
        gradient.frame = self.bounds
        gradient.name = "gradientLayer"
        
        layer.removeFromSuperlayer()
        
        self.layer.insertSublayer(gradient, at: 0)
    }
    func applyWhiteBackground() {
        let whiteLayer = CAGradientLayer()
        whiteLayer.colors = [UIColor.white.cgColor, UIColor.white.cgColor]
        whiteLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        whiteLayer.endPoint = CGPoint(x: 1.0, y: 0.0)
        whiteLayer.frame = self.bounds
        whiteLayer.name = "whiteLayer"
        
        layer.removeFromSuperlayer()
        
        self.layer.insertSublayer(whiteLayer, at: 0)
    }
    
    
    
    func applyBorder(borderWidth: CGFloat, borderColor: UIColor) {
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = borderWidth
    }
    
    func applyCornerRadius (cornerRadius: CGFloat) {
        self.layer.cornerRadius = cornerRadius
    }
    
    
    
}
