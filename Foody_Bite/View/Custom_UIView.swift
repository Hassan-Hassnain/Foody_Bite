//
//  Custom_UIView.swift
//  Foody_Bite
//
//  Created by Usama Sadiq on 3/24/20.
//  Copyright © 2020 Usama Sadiq. All rights reserved.
//

import UIKit


class Custom_UIView: UIView {
    @IBInspectable var cornerRadius: CGFloat = 15 {
        didSet{
            applyCornerRadius()
        }
    }
    @IBInspectable var borderColor: UIColor = .clear {
        didSet{
            updateBorder()
        }
    }
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet{
            updateBorder()
        }
    }
    @IBInspectable var topColor: UIColor = .clear {
        didSet{
            apply_GradientLayer()
        }
    }
    @IBInspectable var bottomColor: UIColor = .clear  {
        didSet{
            apply_GradientLayer()
        }
    }
    @IBInspectable var startPoint: CGPoint = .zero  {
        didSet{
            apply_GradientLayer()
        }
    }
    @IBInspectable var endPoint: CGPoint = .zero  {
        didSet{
            apply_GradientLayer()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        updateUI()
    }
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        updateUI()
    }
    
    func updateUI() {
        self.layer.cornerRadius = cornerRadius
    }
    
    func applyCornerRadius(){
        layer.cornerRadius = self.cornerRadius
    }
    
    func updateBorder() {
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = borderWidth
    }
    
    func apply_GradientLayer () {
        
        remove_GradientLayer()
        
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
    
    
    func remove_GradientLayer () {
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
