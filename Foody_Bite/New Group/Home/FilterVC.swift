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
    //Dezignable Views for background
    @IBOutlet weak var italianView: DezignableView!
    @IBOutlet weak var chinesView: DezignableView!
    @IBOutlet weak var maxicanView: DezignableView!
    @IBOutlet weak var thaiView: DezignableView!
    @IBOutlet weak var arabianView: DezignableView!
    @IBOutlet weak var indianView: DezignableView!
    @IBOutlet weak var americanView: DezignableView!
    @IBOutlet weak var koreanView: DezignableView!
    @IBOutlet weak var european: DezignableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        
        guard let vc = storyboard?.instantiateViewController(identifier: "TrendingRestaurantsVC") as? TrendingRestaurantsVC else {return}
        vc.modalPresentationStyle = .fullScreen
        presentDetail(vc)
        
    }
    @IBAction func categoryButtonTappped(_ sender: DezignableButton ) {
            update(sender: sender)
    }
    
    func update(sender: DezignableButton) {
        italianButton.backgroundFillColor = UIColor.white; italianButton.setupBackground()
        chineseButton.backgroundFillColor = UIColor.white; chineseButton.setupBackground()
        maxicanButton.backgroundFillColor = UIColor.white; maxicanButton.setupBackground()
        thaiButton.backgroundFillColor = UIColor.white; thaiButton.setupBackground()
        arabianButton.backgroundFillColor = UIColor.white; arabianButton.setupBackground()
        indianButton.backgroundFillColor = UIColor.white; indianButton.setupBackground()
        americanButton.backgroundFillColor = UIColor.white; americanButton.setupBackground()
        koreanButton.backgroundFillColor = UIColor.white; koreanButton.setupBackground()
        europeaonButton.backgroundFillColor = UIColor.white; europeaonButton.setupBackground()
        
        sender.backgroundFillColor = nil
        sender.applyGradient(startColor: #colorLiteral(red: 1, green: 0.5490196078, blue: 0.2823529412, alpha: 1), stopColor: #colorLiteral(red: 1, green: 0.337254902, blue: 0.4509803922, alpha: 1))
        sender.applyCornerRadius(cornerRadius: 5)
        sender.applyBorder(borderWidth: 2, borderColor: #colorLiteral(red: 0.6941176471, green: 0.7568627451, blue: 0.9058823529, alpha: 1))
        sender.setupBackground()
    }

  
}
