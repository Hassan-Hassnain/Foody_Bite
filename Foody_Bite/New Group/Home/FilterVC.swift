//
//  FilterVC.swift
//  Foody_Bite
//
//  Created by Usama Sadiq on 3/6/20.
//  Copyright © 2020 Usama Sadiq. All rights reserved.
//

import UIKit
import Dezignables

class FilterVC: UIViewController {
    
    @IBOutlet weak var italianButton: DezignableButton!
    @IBOutlet weak var chineseButton: DezignableButton!
    @IBOutlet weak var maxicanButton: DezignableButton!
    @IBOutlet weak var thaiButton: DezignableButton!
    @IBOutlet weak var arabianButton: DezignableButton!
    @IBOutlet weak var indianButton: DezignableButton!
    @IBOutlet weak var americanButton: DezignableButton!
    @IBOutlet weak var koreanButton: DezignableButton!
    @IBOutlet weak var europeaonButton: DezignableButton!
    
    @IBOutlet weak var progressBar: UIProgressView!
   
    
    var ratingsStar: [UIImage] = []
    let categories = DataService.instance.categores
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func categoryButtonTappped(_ sender: UIButton ) {
        updateButtonAppearance(sender: sender)
    }
    
    
    @IBAction func ratingStarTapped1(_ sender: UIButton) {
        
    }
    
    
    
    
    func updateButtonAppearance(sender: UIButton) {
        
        italianButton.removeGradientLayer()
        chineseButton.removeGradientLayer()
        maxicanButton.removeGradientLayer()
        thaiButton.removeGradientLayer()
        arabianButton.removeGradientLayer()
        indianButton.removeGradientLayer()
        americanButton.removeGradientLayer()
        koreanButton.removeGradientLayer()
        europeaonButton.removeGradientLayer()
        
        italianButton.titleLabel?.textColor = #colorLiteral(red: 0.6941176471, green: 0.7568627451, blue: 0.9058823529, alpha: 1)
        chineseButton.titleLabel?.textColor = #colorLiteral(red: 0.6941176471, green: 0.7568627451, blue: 0.9058823529, alpha: 1)
        maxicanButton.titleLabel?.textColor = #colorLiteral(red: 0.6941176471, green: 0.7568627451, blue: 0.9058823529, alpha: 1)
        thaiButton.titleLabel?.textColor = #colorLiteral(red: 0.6941176471, green: 0.7568627451, blue: 0.9058823529, alpha: 1)
        arabianButton.titleLabel?.textColor = #colorLiteral(red: 0.6941176471, green: 0.7568627451, blue: 0.9058823529, alpha: 1)
        indianButton.titleLabel?.textColor = #colorLiteral(red: 0.6941176471, green: 0.7568627451, blue: 0.9058823529, alpha: 1)
        americanButton.titleLabel?.textColor = #colorLiteral(red: 0.6941176471, green: 0.7568627451, blue: 0.9058823529, alpha: 1)
        koreanButton.titleLabel?.textColor = #colorLiteral(red: 0.6941176471, green: 0.7568627451, blue: 0.9058823529, alpha: 1)
        europeaonButton.titleLabel?.textColor = #colorLiteral(red: 0.6941176471, green: 0.7568627451, blue: 0.9058823529, alpha: 1)
        
        sender.applyGradientLayer(topColor: #colorLiteral(red: 1, green: 0.5490196078, blue: 0.2823529412, alpha: 1), bottomColor: #colorLiteral(red: 1, green: 0.337254902, blue: 0.4509803922, alpha: 1))
        sender.applyCornerRadius(cornerRadius: 5)
        sender.applyBorder(borderWidth: 2, borderColor: #colorLiteral(red: 0.6941176471, green: 0.7568627451, blue: 0.9058823529, alpha: 1))
        sender.titleLabel?.textColor = UIColor.white
        
    }
    
    
}
