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
    
    @IBOutlet weak var searchField: Custom_UITextField!
    
    @IBOutlet weak var ratingStar1: UIButton!
    @IBOutlet weak var ratingStar2: UIButton!
    @IBOutlet weak var ratingStar3: UIButton!
    @IBOutlet weak var ratingStar4: UIButton!
    @IBOutlet weak var ratingStar5: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        IQKeyboardManager.shared.keyboardDistanceFromTextField = 200
        
        searchField.rightButton?.addTarget(self, action: #selector(filterButtonAction), for: .touchUpInside)
        
    }
    //MARK: - SEARCH FIELD RIGHT BUTTON
    @objc func filterButtonAction() {
        navigationController?.popViewController(animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func postButtonTapped(_ sender: Any) {
    }
    @IBAction func homeButtonTapped(_ sender: Any) {
        goTo(fromStoryboar: Storyboards.main, toVC: MainTabBarController.className, animate: false)
    }
    @IBAction func favoriteButtonTapped(_ sender: Any) {
        goTo(fromStoryboar: Storyboards.main, toVC: MyFavoriteVC.className, animate: false)
    }
    @IBAction func notificationButtonTapped(_ sender: Any) {
        goTo(fromStoryboar: Storyboards.main, toVC: NotificationVC.className, animate: false)
    }
    @IBAction func profileButtonTapped(_ sender: Any) {
        goTo(fromStoryboar: Storyboards.main, toVC: ProfileVC.className, animate: false)
    }
    @IBAction func closeButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func ratingStarTapped1(_ sender: UIButton) {
        
    }
    
    
    
}

extension NewReview_2: UITextFieldDelegate {
    
}
