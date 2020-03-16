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
    
    @IBAction func backButtonTapped(_ sender: Any) {
        dismissDetail()
    }
    
  func passString(string: String) {
      print(string)
  }
  


}
