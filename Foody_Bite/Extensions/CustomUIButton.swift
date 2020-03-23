//
//  CustomUIView.swift
//  CustomUiButton
//
//  Created by Usama Sadiq on 3/23/20.
//  Copyright © 2020 Usama Sadiq. All rights reserved.
//

import UIKit

class Custom_UIButton : UIButton {
   
    var cornerRadius: CGFloat = 15 {
        didSet{
            applyCornerRadius()
        }
    }
    
    var borderColor: UIColor = .clear {
        didSet{
            applyBorder()
        }
    }
    
    var borderWidth: CGFloat = 3 {
        didSet{
            applyBorder()
        }
    }
    
    var textColor: UIColor = .clear {
        didSet{
            applyTextColor()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)

    }
    func updateUI(){
        
        cornerRadius = 10
        borderWidth = 2
        borderColor = #colorLiteral(red: 0.6941176471, green: 0.7568627451, blue: 0.9058823529, alpha: 1)
        textColor = #colorLiteral(red: 0.6941176471, green: 0.7568627451, blue: 0.9058823529, alpha: 1)
    }
    
    func applyBorder() {
        layer.borderColor = borderColor.cgColor
        layer.borderWidth = borderWidth
    }
   
    
    func applyCornerRadius () {
        self.layer.cornerRadius = cornerRadius
    }
    
    func applyTextColor(){
        self.setTitleColor(textColor, for: .normal)
    }
    
}


 
