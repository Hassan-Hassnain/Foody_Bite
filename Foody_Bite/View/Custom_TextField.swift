//
//  Custom_TextField.swift
//  Foody_Bite
//
//  Created by Usama Sadiq on 2/29/20.
//  Copyright © 2020 Usama Sadiq. All rights reserved.
//

import UIKit
@IBDesignable class CustomTextField: UITextField {

@IBInspectable var cornerRadius: CGFloat = 0 {
    didSet {
        layer.cornerRadius = cornerRadius
    }
}
@IBInspectable var borderWidth: CGFloat = 0 {
    didSet {
        layer.borderWidth = borderWidth
    }
}
@IBInspectable var borderColor: UIColor = UIColor.black {
    didSet {
        layer.borderColor = borderColor.cgColor
    }
}
@IBInspectable var IconImage: UIImage? {
    didSet {
       leftViewIcon(component: self, image: self.IconImage)
    }
}
@IBInspectable var iconTintColor: UIColor = UIColor.clear {
    didSet {
        leftViewTintColor(component: self, color: self.iconTintColor)
    }
}
@IBInspectable var IconPadding: CGFloat = 0
      override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
          var textRect = super.leftViewRect(forBounds: bounds)
          textRect.origin.x += IconPadding
          return textRect
      }
@IBInspectable var plcHldrColor: UIColor {
    get {
        guard let currentAttributedPlaceholderColor = attributedPlaceholder?.attribute(NSAttributedString.Key.foregroundColor, at: 0, effectiveRange: nil) as? UIColor else { return UIColor.clear }
            return currentAttributedPlaceholderColor
        }
        set {
            guard let currentAttributedString = attributedPlaceholder else { return }
            let attributes = [NSAttributedString.Key.foregroundColor : newValue]

            attributedPlaceholder = NSAttributedString(string: currentAttributedString.string, attributes: attributes)
        }
    
    func updateCornerRadius (component: UIView, radius: CGFloat){
            component.layer.cornerRadius = radius
   
        }
}
 

