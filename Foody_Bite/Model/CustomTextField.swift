//
//  CustomTextField.swift
//  Window-Shopper
//
//  Created by Usama Sadiq on 2/1/20.
//  Copyright © 2020 Usama Sadiq. All rights reserved.
//

import UIKit

@IBDesignable
class CustomTextField: UITextField {
    
    override func draw(_ rect: CGRect) {
        let size: CGFloat = 20
        let currencyLbl = UILabel(frame: CGRect(x: 5, y: (frame.size.height/2) - size/2, width: size, height: size) )
//        currencyLbl.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 0.5127354452)
        currencyLbl.textAlignment = .center
        currencyLbl.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        currencyLbl.layer.cornerRadius = currencyLbl.frame.size.width/2
        currencyLbl.clipsToBounds = true
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = .current
        currencyLbl.text = formatter.currencySymbol
        addSubview(currencyLbl)
    }

    override func prepareForInterfaceBuilder() {
        customizeView()
    }
    override func awakeFromNib() {
        super.awakeFromNib()
             
        customizeView()
    }

    func customizeView (){
//        backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.25)
        layer.cornerRadius = 10.0
        textAlignment = .center
        
        if placeholder == nil {
            placeholder =  ""
        }
        if let p = placeholder {
            let place = NSAttributedString(string: p, attributes: [.foregroundColor: UIColor.white ])
            attributedPlaceholder = place
            textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
    }
}
