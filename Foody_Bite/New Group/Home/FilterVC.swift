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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        dismissDetail()
    }
    @IBAction func categoryButtonTappped(_ sender: DezignableButton ) {
        print(sender.titleLabel!)
        self.italianButton.backgroundFillColor = UIColor.clear
        self.chineseButton.backgroundFillColor = UIColor.clear
        self.maxicanButton.backgroundFillColor = UIColor.clear
        self.thaiButton.backgroundFillColor = UIColor.clear
        self.arabianButton.backgroundFillColor = UIColor.clear
        self.indianButton.backgroundFillColor = UIColor.clear
        self.americanButton.backgroundFillColor = UIColor.clear
        self.koreanButton.backgroundFillColor = UIColor.clear
        self.europeaonButton.backgroundFillColor = UIColor.clear
        
        sender.backgroundGradientStopColor = #colorLiteral(red: 1, green: 0.5490196078, blue: 0.2823529412, alpha: 1)
        sender.backgroundGradientStartColor = #colorLiteral(red: 1, green: 0.337254902, blue: 0.4509803922, alpha: 1)
        sender.backgroundGradientStartPoint = CGPoint(x: 1, y: 0)
    }
    

    

}
