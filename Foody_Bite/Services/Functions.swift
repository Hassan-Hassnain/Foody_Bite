//
//  Functions.swift
//  Foody_Bite
//
//  Created by Usama Sadiq on 3/21/20.
//  Copyright © 2020 Usama Sadiq. All rights reserved.
//

import Foundation
import UIKit
//
//extension UIViewController{
//    func updateRatingStars(state: [Bool] , sender: UIButton) -> ([Bool], [UIImage]){
//        var ratingStar1: UIImage = #imageLiteral(resourceName: "Icon_Star_Grey")
//        var ratingStar2: UIImage = #imageLiteral(resourceName: "Icon_Star_Grey")
//        var ratingStar3: UIImage = #imageLiteral(resourceName: "Icon_Star_Grey")
//        var ratingStar4: UIImage = #imageLiteral(resourceName: "Icon_Star_Grey")
//        var ratingStar5: UIImage = #imageLiteral(resourceName: "Icon_Star_Grey")
//        
//        var selected: [Bool] = state
//        
//        let yellowStar = UIImage(named: "Icon_Star_Yellow.png") as UIImage?
//        let greyStar = UIImage(named: "Icon_Star_Grey.png") as UIImage?
//        
//        if sender == ratingStar1 {
//            
//            if !selected[0] {
//                ratingStar1 = yellowStar!
//                selected[0] = true
//            } else {
//                ratingStar1 = greyStar!
//                selected[0] = false
//                ratingStar2 = greyStar!
//                selected[1] = false
//                ratingStar3 = greyStar!
//                selected[2] = false
//                ratingStar4 = greyStar!
//                selected[3] = false
//                ratingStar5 = greyStar!
//                selected[4] = false
//            }
//        }
//        
//        if sender == ratingStar2 {
//            if !selected[1] {
//                ratingStar1 = yellowStar!
//                selected[0] = true
//                ratingStar2 = yellowStar!
//                selected[1] = true
//            } else {
//                ratingStar2 = greyStar!
//                selected[1] = false
//                ratingStar3 = greyStar!
//                selected[2] = false
//                ratingStar4 = greyStar!
//                selected[3] = false
//                ratingStar5 = greyStar!
//                selected[4] = false
//            }
//        }
//        
//        if sender == ratingStar3 {
//            if !selected[2] {
//                ratingStar1 = yellowStar!
//                selected[0] = true
//                ratingStar2 = yellowStar!
//                selected[1] = true
//                ratingStar3 = yellowStar!
//                selected[2] = true
//            } else {
//                ratingStar3 = greyStar!
//                selected[2] = false
//                ratingStar4 = greyStar!
//                selected[3] = false
//                ratingStar5 = greyStar!
//                selected[4] = false
//            }
//        }
//        
//        if sender == ratingStar4 {
//            if !selected[3] {
//                ratingStar1 = yellowStar!
//                selected[0] = true
//                ratingStar2 = yellowStar!
//                selected[1] = true
//                ratingStar3 = yellowStar!
//                selected[2] = true
//                ratingStar4 = yellowStar!
//                selected[3] = true
//            } else {
//                ratingStar4 = greyStar!
//                selected[3] = false
//                ratingStar5 = greyStar!
//                selected[4] = false
//                
//            }
//        }
//        
//        if sender == ratingStar5 {
//            if !selected[4] {
//                ratingStar1 = yellowStar!
//                selected[0] = true
//                ratingStar2 = yellowStar!
//                selected[1] = true
//                ratingStar3 = yellowStar!
//                selected[2] = true
//                ratingStar4 = yellowStar!
//                selected[3] = true
//                ratingStar5 = yellowStar!
//                selected[4] = true
//            } else {
//                ratingStar5 = greyStar!
//                selected[4] = false
//            }
//        }
//        let ratings = [ratingStar1,ratingStar2,ratingStar3,ratingStar4,ratingStar5]
//        
//        return (selected, ratings)
//    }
//    
//}
