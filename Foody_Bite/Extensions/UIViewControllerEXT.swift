//
//  UIViewControllerEXT.swift
//  Goal-Post
//
//  Created by Usama Sadiq on 2/13/20.
//  Copyright © 2020 Usama Sadiq. All rights reserved.
//

import UIKit

extension UIViewController {
    func presentDetail(_ viewControllerToPresent: UIViewController) {
        let transition = CATransition()
        transition.duration = 0.6
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
        self.view.window?.layer.add(transition, forKey: kCATransition)
        
        present(viewControllerToPresent, animated: true, completion: nil)
    }
    func presentSecondary(_ viewControllerToPresent: UIViewController) {
        let transition = CATransition()
        transition.duration = 0.6
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
        
        guard let presentedViewController = presentedViewController else {return}
        
        presentedViewController.dismiss(animated: false) {
            self.view.window?.layer.add(transition, forKey: kCATransition)
            self.present(viewControllerToPresent, animated: false, completion: nil)
        }
    }
    
    func dismissDetail() {
        let transition = CATransition()
        transition.duration = 0.6
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromLeft
        
        self.view.window?.layer.add(transition, forKey: kCATransition)
        
        dismiss(animated: false, completion: nil)
    }
    
    
//    func goTo( toVC to: String, animate: Bool) {
//        guard let vc = storyboard?.instantiateViewController(identifier: to) else {return}
//        vc.modalPresentationStyle = .fullScreen
//        if animate {
//            presentDetail(vc)
//        } else {
//            self.present(vc, animated: false, completion: nil)
//        }
//    }
    
    func goTo(fromStoryboar sb: UIStoryboard, toVC to: String, animate: Bool) {
       let vc = sb.instantiateViewController(identifier: to)
        vc.modalPresentationStyle = .fullScreen
        if animate {
            presentDetail(vc)
        } else {
            self.present(vc, animated: false, completion: nil)
        }
    }
    
    
    
}
