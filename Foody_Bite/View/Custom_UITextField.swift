//
//  DesignableUITextField.swift
//  SkyApp
//
//  Created by Mark Moeykens on 12/16/16.
//  Copyright © 2016 Mark Moeykens. All rights reserved.
//

import UIKit

class Custom_UITextField: UITextField {
    
    // MARK: - Border
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
    
    
    // MARK: - Corner Radius
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    // MARK: - TextField Left View
    
    var rightButton: UIButton?
    var leftButton: UIButton?
    
    @IBInspectable var leftImage: UIImage? {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var leftPadding: CGFloat = 0 {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var rightImage: UIImage? {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var rightPadding: CGFloat = 0 {
        didSet {
            updateView()
        }
    }
    
    
    private var _isRightViewVisible: Bool = true
    var isRightViewVisible: Bool {
        get {
            return _isRightViewVisible
        }
        set {
            _isRightViewVisible = newValue
            updateView()
        }
    }
    
    
    private func updateView() {
        setLeftImage()
        setRightImage()
        //        setRightButton()
        
        // Placeholder text color
        attributedPlaceholder = NSAttributedString(string: placeholder != nil ?
            placeholder! :
            "", attributes:[NSAttributedString.Key.foregroundColor: tintColor as Any])
    }
    
    func setLeftImage() {
        leftViewMode = UITextField.ViewMode.always
        var view: UIView
        
        if let image = leftImage {
            let button = UIButton(frame: CGRect(x: leftPadding, y: 0, width: 20, height: 20))
            button.setImage(image, for: .normal)
            // Note: In order for your image to use the tint color, you have to select the image in the Assets.xcassets and change the "Render As" property to "Template Image".
            button.tintColor = tintColor
            
            var width = button.frame.width + leftPadding
            
            if borderStyle == UITextField.BorderStyle.none || borderStyle == UITextField.BorderStyle.line {
                width += 5
            }
            
            leftButton = button
            view = UIView(frame: CGRect(x: 0, y: 0, width: width, height: 20))
            view.addSubview(button)
        } else {
            view = UIView(frame: CGRect(x: 0, y: 0, width: leftPadding, height: 20))
        }
        
        leftView = view
    }
    
    func setRightImage() {
        rightViewMode = UITextField.ViewMode.always
        
        var view: UIView
        
        if let image = rightImage, isRightViewVisible {
            let button = UIButton(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
            button.setImage(image, for: .normal)
            // Note: In order for your image to use the tint color, you have to select the image in the Assets.xcassets and change the "Render As" property to "Template Image".
            button.tintColor = tintColor
            
            var width = button.frame.width + rightPadding
            
            if borderStyle == UITextField.BorderStyle.none || borderStyle == UITextField.BorderStyle.line {
                width += 5
            }
            
            rightButton = button
            view = UIView(frame: CGRect(x: 0, y: 0, width: width, height: 20))
            view.addSubview(button)
            print("Right button Set")
            
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
