//
//  RatingAndReviewVC.swift
//  Foody_Bite
//
//  Created by Usama Sadiq on 3/7/20.
//  Copyright © 2020 Usama Sadiq. All rights reserved.
//

import UIKit

class RatingAndReviewVC: UIViewController {

    
    @IBOutlet weak var ratingStar1: UIButton!
    @IBOutlet weak var ratingStar2: UIButton!
    @IBOutlet weak var ratingStar3: UIButton!
    @IBOutlet weak var ratingStar4: UIButton!
    @IBOutlet weak var ratingStar5: UIButton!
    
    var selected: [Bool] = [false, false, false, false, false]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func escapeButtonTapped(_ sender: Any) {
        dismissDetail()
    }
    @IBAction func ratingStarTapped1(_ sender: UIButton) {

        let yellowStar = UIImage(named: "Icon_Star_Yellow.png") as UIImage?
        let greyStar = UIImage(named: "Icon_Star_Grey.png") as UIImage?
        
        if sender == ratingStar1 {
            
            if !selected[0] {
                ratingStar1.setImage(yellowStar, for: .normal)
                selected[0] = true
            } else {
                ratingStar1.setImage(greyStar, for: .normal)
                selected[0] = false
            }
        }
        
        if sender == ratingStar2 {
            if !selected[1] {
                ratingStar2.setImage(yellowStar, for: .normal)
                selected[1] = true
            } else {
                ratingStar2.setImage(greyStar, for: .normal)
                selected[1] = false
            }
        }

        if sender == ratingStar3 {
            if !selected[2] {
                ratingStar3.setImage(yellowStar, for: .normal)
                selected[2] = true
            } else {
                ratingStar3.setImage(greyStar, for: .normal)
                selected[2] = false
            }
        }

        if sender == ratingStar4 {
            if !selected[3] {
                ratingStar4.setImage(yellowStar, for: .normal)
                selected[3] = true
            } else {
                ratingStar4.setImage(greyStar, for: .normal)
                selected[3] = false
            }
        }

        if sender == ratingStar5 {
            if !selected[4] {
                ratingStar5.setImage(yellowStar, for: .normal)
                selected[4] = true
            } else {
                ratingStar5.setImage(greyStar, for: .normal)
                selected[4] = false
            }
        }
        
        
    }

}
