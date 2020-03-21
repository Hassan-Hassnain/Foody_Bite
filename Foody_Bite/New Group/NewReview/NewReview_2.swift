//
//  NewReview_2.swift
//  Foody_Bite
//3-    10402    -1200    31208
//6-    5355                2135   32000
//12- 2836.79 - 4042 - 700+FED 2%  34041.
//  Created by Usama Sadiq on 3/8/20.
//  Copyright © 2020 Usama Sadiq. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

class NewReview_2: UIViewController {
    
    @IBOutlet weak var searchField: UITextFieldX!
    
    @IBOutlet weak var ratingStar1: UIButton!
    @IBOutlet weak var ratingStar2: UIButton!
    @IBOutlet weak var ratingStar3: UIButton!
    @IBOutlet weak var ratingStar4: UIButton!
    @IBOutlet weak var ratingStar5: UIButton!
    
   var selected: [Bool] = [false, false, false, false, false]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        IQKeyboardManager.shared.keyboardDistanceFromTextField = 200
        
        setSearchFieldLeftButton()
    }
    @IBAction func addButtonTapped(_ sender: Any) {
        dismissDetail()
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        MainTabBarController().selectedIndex = 2
        dismissDetail()
//        goTo(fromStoryboar: Storyboards.main, toVC: "MainTabBarController", animate: false)
    }
    
    @IBAction func postButtonTapped(_ sender: Any) {
    }
    @IBAction func homeButtonTapped(_ sender: Any) {
       goTo(fromStoryboar: Storyboards.main, toVC: "MainTabBarController", animate: false)
    }
    @IBAction func favoriteButtonTapped(_ sender: Any) {
        goTo(fromStoryboar: Storyboards.main, toVC: "MyFavoriteVC", animate: false)
    }
    @IBAction func notificationButtonTapped(_ sender: Any) {
        goTo(fromStoryboar: Storyboards.main, toVC: "NotificationVC", animate: false)
    }
    @IBAction func profileButtonTapped(_ sender: Any) {
        goTo(fromStoryboar: Storyboards.main, toVC: "ProfileVC", animate: false)
    }
    @IBAction func closeButtonTapped(_ sender: Any) {
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
    //MARK: - SEARCH FIELD RIGHT BUTTON
    func setSearchFieldLeftButton() {
        
        var view: UIView
        let button = UIButton(frame: CGRect(x: 20, y: 0, width: 20, height: 20))
        button.setImage(UIImage(named: "Icon_Search_grey.png"), for: .normal)
        // Note: In order for your image to use the tint color, you have to select the image in the Assets.xcassets and change the "Render As" property to "Template Image".
        button.tintColor = searchField.tintColor
        
        var width = button.frame.width + 20
        
        if searchField.borderStyle == UITextField.BorderStyle.none || searchField.borderStyle == UITextField.BorderStyle.line {
            width += 5
        }
        view = UIView(frame: CGRect(x: 0, y: 0, width: width, height: 20))
        button.addTarget(self, action: #selector(filterButtonAction), for: .touchUpInside)
        view.addSubview(button)
        searchField.leftView = view
    }
    @objc func filterButtonAction() {
        // code for search field leftview button
        print("SearchField search button tapped")
    }
    
}

extension NewReview_2: UITextFieldDelegate {
    
}
