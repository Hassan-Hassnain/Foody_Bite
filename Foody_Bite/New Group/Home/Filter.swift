//
//  Filter.swift
//  Foody_Bite
//
//  Created by Usama Sadiq on 3/2/20.
//  Copyright © 2020 Usama Sadiq. All rights reserved.
//

import UIKit
import Dezignables

class Filter: UIViewController {
    
    @IBOutlet weak var catButton1: DezignableButton!
    @IBOutlet weak var catButton2: DezignableButton!
    @IBOutlet weak var catButton3: DezignableButton!
    @IBOutlet weak var catButton4: DezignableButton!
    @IBOutlet weak var catButton5: DezignableButton!
    @IBOutlet weak var catButton6: DezignableButton!
    @IBOutlet weak var catButton7: DezignableButton!
    @IBOutlet weak var catButton8: DezignableButton!
    @IBOutlet weak var catButton9: DezignableButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
// Category buttons not working
    
    @IBAction func cat1ButtonWasPressed(_ sender: DezignableButton) {
        setColor(sender: sender)
    }
    @IBAction func categoryButtonWasPressed(_ sender: DezignableButton!) {
        
        
    }
    
    @IBAction func backButtonWasTapped(_ sender: Any) {
        self.dismissDetail()
    }
    
    func setColor(sender: DezignableButton) {
        catButton1.backgroundFillColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        catButton2.backgroundFillColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        catButton3.backgroundFillColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        catButton4.backgroundFillColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        catButton5.backgroundFillColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        catButton6.backgroundFillColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        catButton7.backgroundFillColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        catButton8.backgroundFillColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        catButton9.backgroundFillColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        catButton1.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        catButton2.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        catButton3.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        catButton4.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        catButton5.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        catButton6.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        catButton7.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        catButton8.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        catButton9.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        
        sender.backgroundGradientStartColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
        sender.backgroundGradientStopColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        sender.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        print("color set")
    }
    
}
