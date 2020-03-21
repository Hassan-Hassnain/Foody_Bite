//
//  Router.swift
//  Foody_Bite
//
//  Created by Usama Sadiq on 3/20/20.
//  Copyright © 2020 Usama Sadiq. All rights reserved.
//

import UIKit

class Router {
    static let instance = Router()
    
//     var index = 1
    
    func openLoginVC(controller:UIViewController) {
        let control = Storyboards.signUp.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
        controller.show(control, sender: nil)
    }
    
    
  
}
