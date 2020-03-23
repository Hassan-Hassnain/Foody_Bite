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
    
    func applyBorder(borderWidth: CGFloat, borderColor: UIColor) {
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = borderWidth
    }
    
    func applyCornerRadius (cornerRadius: CGFloat) {
        self.layer.cornerRadius = cornerRadius
    }
    
    func applyGradientLayer () {
               
               // Manage gradient colors in an array
            let topColor: UIColor = .red
            let bottomColor: UIColor = .orange
               let gradientColors: [CGColor] = [topColor.cgColor, bottomColor.cgColor]
               let gradientLayer: CAGradientLayer = CAGradientLayer ()
               gradientLayer.colors = gradientColors
               gradientLayer.startPoint = CGPoint(x: 0, y: 0)
               gradientLayer.endPoint = CGPoint(x: 1, y: 0)
               gradientLayer.frame = self.bounds
               gradientLayer.name = "grad"
               
               var present: Bool = false
               
               if let layers = self.layer.sublayers {
                         if layers.count > 1 {
                             for layer in layers {
                                 if layer.name == "grad" {
                                     present = true
                                 }
                             }
                             
                         }
                     }
               if !present {
                         self.layer.insertSublayer (gradientLayer, at: 0)
               }
            self.clipsToBounds = true
            
            
               print(gradientLayer.name!)
               print("One's Layer \(String(describing: self.layer.sublayers?.count))")
           }
           
           
           func removeGradientLayer () {
               if let layers = self.layer.sublayers {
                   if layers.count > 1 {
                       for layer in layers {
                           if layer.name == "grad" {
                               layer.removeFromSuperlayer()
                           }
                       }
                       
                       print("One's Layer \(layers.count)")
                   }
               }
           }
    
    
    
}
