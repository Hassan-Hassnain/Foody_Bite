//
//  PreviewVC.swift
//  Foody_Bite
//
//  Created by Usama Sadiq on 3/7/20.
//  Copyright © 2020 Usama Sadiq. All rights reserved.
//

import UIKit

class PreviewVC: UIViewController {

    var image: UIImage?

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
       
        imageView.image  = image
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
    }
    
    
    @IBAction func backButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
  func passString(string: String) {
      print(string)
  }
  


}
