//
//  DesignableTextFiled.swift
//  Foody_Bite
//
//  Created by Usama Sadiq on 2/29/20.
//  Copyright © 2020 Usama Sadiq. All rights reserved.
//

import UIKit

@IBDesignable
class DesignableUITextField: UITextField {
//MARK: - BORDER COLOR, BORDER WIDTH, CORNER RADIUS
    
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
    
    @IBInspectable var borderColor: UIColor = UIColor.lightGray {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
//MARK: - LEFT IMAGE AND PLACE HOLDER COLOR
    // Provides left padding for images
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.leftViewRect(forBounds: bounds)
        textRect.origin.x += leftPadding
        return textRect
    }
    
    

    @IBInspectable var leftImage: UIImage? {
        didSet {
            updateView()
        }
    }

    @IBInspectable var leftPadding: CGFloat = 0

    @IBInspectable var color: UIColor = UIColor.lightGray {
        didSet {
            updateView()
        }
    }
    
    
    @IBInspectable var rightImage: UIImage? {
        didSet {
            updateView()
        }
    }
    @IBInspectable var rightPadding: CGFloat = 0

   

    func updateView() {
        if let image = leftImage {
            leftViewMode = UITextField.ViewMode.always
            let leftImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
            leftImageView.contentMode = .scaleAspectFit
            leftImageView.image = image
            // Note: In order for your image to use the tint color, you have to select the image in the Assets.xcassets and change the "Render As" property to "Template Image".
            leftImageView.tintColor = color
            leftView = leftImageView
        } else {
            leftViewMode = UITextField.ViewMode.never
            leftView = nil
        }
        if let image = rightImage {
                   leftViewMode = UITextField.ViewMode.always
                   let leftImageView = UIImageView(frame: CGRect(x: 200, y: 0, width: 20, height: 20))
                   leftImageView.contentMode = .scaleAspectFit
                   leftImageView.image = image
                   // Note: In order for your image to use the tint color, you have to select the image in the Assets.xcassets and change the "Render As" property to "Template Image".
                   leftImageView.tintColor = color
                   rightView = leftImageView
               } else {
                   rightViewMode = UITextField.ViewMode.never
                   rightView = nil
               }

        // Placeholder text color
        attributedPlaceholder = NSAttributedString(string: placeholder != nil ?  placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: color])
    }
    
    func setRightImage() {
          rightViewMode = UITextField.ViewMode.always
          
          var view: UIView
          
          if let image = rightImage{
              let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
              imageView.image = image
              // Note: In order for your image to use the tint color, you have to select the image in the Assets.xcassets and change the "Render As" property to "Template Image".
              imageView.tintColor = tintColor
              
              var width = imageView.frame.width + rightPadding
              
              if borderStyle == UITextField.BorderStyle.none || borderStyle == UITextField.BorderStyle.line {
                  width += 5
              }
              
              view = UIView(frame: CGRect(x: 0, y: 0, width: width, height: 20))
              view.addSubview(imageView)
              
          } else {
              view = UIView(frame: CGRect(x: 0, y: 0, width: rightPadding, height: 20))
          }
          
          rightView = view
      }
    
//MARK: - PLACE HOLDER AND  EDITING PADDING
    var padding = UIEdgeInsets()
    
    @IBInspectable var L_textPadding: CGFloat = 0 {
        didSet {
            updatePadding()
            
        }
    }
    @IBInspectable var R_textPadding: CGFloat = 0 {
        didSet {
            updatePadding()
            
        }
    }
    
    
    func updatePadding() {
        let textLeftPadding = leftPadding + L_textPadding
        padding = UIEdgeInsets(top: 0, left: textLeftPadding, bottom: 0, right: 5)
    }

    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}
