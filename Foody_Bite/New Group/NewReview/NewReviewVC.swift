//
//  NewReviewVC.swift
//  Foody_Bite
//
//  Created by Usama Sadiq on 3/8/20.
//  Copyright © 2020 Usama Sadiq. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

class NewReviewVC: UIViewController {
   
    @IBOutlet weak var searchField: Custom_UITextField!
    @IBOutlet weak var tabbarItem: UITabBarItem!
    @IBOutlet var tabbarView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        IQKeyboardManager.shared.keyboardDistanceFromTextField = 100
        
        searchField.delegate = self
        searchField.rightButton?.addTarget(self, action: #selector(filterButtonAction), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = false
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        navigationController?.customPush(HomeVC.className, animate: false)
    }
    
    @objc func filterButtonAction() {
        navigationController?.customPush(NewReview_2.className, animate: true)
    }

}

extension NewReviewVC: UITextFieldDelegate {}

