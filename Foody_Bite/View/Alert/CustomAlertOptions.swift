//
//  CustomAlertOptions.swift
//  Foody_Bite
//
//  Created by Usama Sadiq on 3/11/20.
//  Copyright © 2020 Usama Sadiq. All rights reserved.
//

import UIKit

class CustomAlertOptions: UIView {
    
    static let instance = CustomAlertOptions()
    @IBOutlet var parentView: UIView!
    
    var delegate: CustomAlertOptionsDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        Bundle.main.loadNibNamed("CustomAlertOptions", owner: self, options: nil)
        commonInit()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        parentView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        parentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    @IBAction func editButton(_ sender: Any) {
        
        parentView.removeFromSuperview()
    }
    @IBAction func deleteButtonTapped(_ sender: Any) {
        parentView.removeFromSuperview()
    }
    @IBAction func cancelButtonTapped(_ sender: Any) {
        parentView.removeFromSuperview()
    }
    
    func showAlert(){
        
        UIApplication.shared.keyWindow?.addSubview(parentView)
    }
}
