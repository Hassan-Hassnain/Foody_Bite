//
//  FilterVC.swift
//  Foody_Bite
//
//  Created by Usama Sadiq on 3/6/20.
//  Copyright © 2020 Usama Sadiq. All rights reserved.
//

import UIKit

class FilterVC: UIViewController {
    
    @IBOutlet weak var italianButton: Custom_UIButton!
    @IBOutlet weak var chineseButton: Custom_UIButton!
    @IBOutlet weak var maxicanButton: Custom_UIButton!
    @IBOutlet weak var thaiButton: Custom_UIButton!
    @IBOutlet weak var arabianButton: Custom_UIButton!
    @IBOutlet weak var indianButton: Custom_UIButton!
    @IBOutlet weak var americanButton: Custom_UIButton!
    @IBOutlet weak var koreanButton: Custom_UIButton!
    @IBOutlet weak var europeaonButton: Custom_UIButton!
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var ratingStarView: RatingStarsView!
    
    var ratingsStar: [UIImage] = []
    let categories = DataService.instance.categores
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateAllUI()
        
        //
        ratingStarView.getRatedValue { (value) in
            print(value)
        }
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func categoryButtonTappped(_ sender: Custom_UIButton ) {
        updateButtonAppearance(sender: sender)
    }
    
    
  
    
    func updateButtonAppearance(sender: Custom_UIButton) {
        
        italianButton.removeGradientLayer()
        chineseButton.removeGradientLayer()
        maxicanButton.removeGradientLayer()
        thaiButton.removeGradientLayer()
        arabianButton.removeGradientLayer()
        indianButton.removeGradientLayer()
        americanButton.removeGradientLayer()
        koreanButton.removeGradientLayer()
        europeaonButton.removeGradientLayer()
        
        updateAllUI()
        
        sender.applyGradientLayer()
        sender.textColor = .white
    }
    
      func updateAllUI(){
          italianButton.updateUI()
          chineseButton.updateUI()
          maxicanButton.updateUI()
          thaiButton.updateUI()
          arabianButton.updateUI()
          indianButton.updateUI()
          americanButton.updateUI()
          koreanButton.updateUI()
          europeaonButton.updateUI()
        
      }
      
}
