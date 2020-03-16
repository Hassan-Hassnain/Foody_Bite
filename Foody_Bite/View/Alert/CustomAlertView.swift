//
//  CustomAlertView.swift
//  Foody_Bite
//
//  Created by Usama Sadiq on 3/11/20.
//  Copyright © 2020 Usama Sadiq. All rights reserved.
//

import UIKit

class CustomAlertView: UIView {
    static let instance = CustomAlertView()
    @IBOutlet var parentView: UIView!
    @IBOutlet weak var messageLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        Bundle.main.loadNibNamed("CustomAlertView", owner: self, options: nil)
        commonInit()
        
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        parentView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        parentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    @IBAction func noButtonTapped(_ sender: Any) {
        parentView.removeFromSuperview()    }
    @IBAction func yesButtonTapped(_ sender: Any) {
        parentView.removeFromSuperview()
    }
    
    func showAlert(alertMessage message: String){
        self.messageLabel.text = message
        UIApplication.shared.keyWindow?.addSubview(parentView)
    }
}

extension CustomAlertView: CustomAlertOptionsDelegate {
    func editButtonClicked() {
        print("Delegate fuction call ")
    }
    
    func deleteButtonClicked() {
        print("Delegate fuction call ")
    }
    
    func cancelButtonClicked() {
        print("Delegate fuction call ")
    }
    
    
   
    
}
