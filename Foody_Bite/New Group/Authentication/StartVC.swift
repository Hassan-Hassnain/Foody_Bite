//
//  StartVC.swift
//  Foody_Bite
//
//  Created by Usama Sadiq on 2/29/20.
//  Copyright © 2020 Usama Sadiq. All rights reserved.
//

import UIKit

class StartVC: UIViewController {
    
    @IBOutlet weak var bgImage: UIImageView!
    @IBOutlet weak var appTitle: UILabel!
    var finalFrame = CGRect()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        finalFrame = appTitle.frame
        appTitle.alpha = 0.0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animateBackground()
    }
    
    func  animateBackground() {
        
        UIView.animate(withDuration: 1.5, animations: {
            
            self.bgImage.transform = CGAffineTransform(scaleX: 1.118, y: 1.118)
            let radians = 17 / 180.0 * CGFloat.pi
            let rotation = self.bgImage.transform.rotated(by: radians);
            self.bgImage.transform = rotation
            
        }) { (finnished) in
            self.appTitle.frame = CGRect(x: 100, y: 415.5 * 1.5, width: self.finalFrame.width * 10 , height: self.finalFrame.height * 10)
            
            UIView.animate(withDuration: 0.75, delay: 0.0, animations:  {
                self.appTitle.alpha = 1.0
                self.appTitle.frame = self.finalFrame
            }){ (finnished) in
                UIView.animate(withDuration: 2.0, delay: 6.0, animations: {
                    Router.instance.openLoginVC(controller: self)
                }, completion: nil)
            }
        }
        
        
        
    }
    
}
