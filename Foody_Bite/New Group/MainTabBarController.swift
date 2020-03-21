//
//  MainTabBarController.swift
//  Foody_Bite
//
//  Created by Usama Sadiq on 3/21/20.
//  Copyright © 2020 Usama Sadiq. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {


    override func viewDidLoad() {
        super.viewDidLoad()

        print("View Controllers- \(String(describing: viewControllers))")
        print("Selected Controllers- \(String(describing: selectedViewController))")
        print("Selected index- \(selectedIndex)")
    }
    
    

    

}
