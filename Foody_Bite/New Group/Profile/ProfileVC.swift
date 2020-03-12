//
//  ProfileVC.swift
//  Foody_Bite
//
//  Created by Usama Sadiq on 3/8/20.
//  Copyright © 2020 Usama Sadiq. All rights reserved.
//

import UIKit
import Dezignables

class ProfileVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var alertBG: UIView!
    @IBOutlet weak var alertOptions: DezignableView!
    @IBOutlet weak var alertOptions_2: DezignableView!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var alertOption1CenterYConstraint: NSLayoutConstraint!
    @IBOutlet weak var alertOption2CenterYConstraint: NSLayoutConstraint!
    @IBOutlet weak var alertBGTopConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        hideAlert1()
        hideAlert2()
        
    }
    @IBAction func backButtonTapped(_ sender: Any) {
        dismissDetail()
        
    }
    @IBAction func homeButtonTapped(_ sender: Any) {
        goTo(toVC: "HomeVC", animate: false)
    }
    @IBAction func favoriteButtonTapped(_ sender: Any) {
        goTo(toVC: "MyFavoriteVC", animate: false)
    }
    @IBAction func notificationButtonTapped(_ sender: Any) {
        goTo(toVC: "NotificationVC", animate: false)
    }
    @IBAction func profileButtonTapped(_ sender: Any) {
//        goTo(toVC: "ProfileVC", animate: false)
    }
    @IBAction func addButtonTapped(_ sender: Any) {
        goTo(toVC: "NewReviewVC", animate: true)
    }
    @IBAction func reviewsButtonTapped(_ sender: Any) {
        goTo(toVC: "ReviewsVC", animate: true)
    }
    @IBAction func followersButtonTapped(_ sender: Any) {
        goTo(toVC: "FollowersVC", animate: true)
    }
    @IBAction func followingButtonTapped(_ sender: Any) {
        goTo(toVC: "FollowingVC", animate: true)
    }
    @IBAction func EditProfileButtonTapped(_ sender: Any) {
        goTo(toVC: "EditProfileVC", animate: true)
    }
    @IBAction func settingsButtonTapped(_ sender: Any) {
        goTo(toVC: "SettingsVC", animate: true)
    }
    
    //MARK: - Alert functions and Actions
    @IBAction func editButtonTapped(_ sender: Any) {
//        hideAlert1()
        goTo(toVC: "EditReviewVC", animate: true)
    }
    @IBAction func deletButtonTapped(_ sender: Any) {
        hideAlert1()
        showAlert2()
    }
    @IBAction func cancelButtonTapped(_ sender: Any) {
        hideAlert1()
    }
    
    @IBAction func noButtonTapped(_ sender: Any) {       
        hideAlert2()
    }
    @IBAction func yesButtonTapped(_ sender: Any) {
        print("Yes Button Clicked")
        hideAlert2()
    }

    
    func hideAlert1() {
        alertBG.isHidden = true
        alertOptions.isHidden = true
        alertOption1CenterYConstraint.constant = 600
         alertBGTopConstraint.constant = UIScreen.main.bounds.height
    }
    
    func showAlert1() {
        alertOption1CenterYConstraint.constant = 0
        alertBGTopConstraint.constant = 0
        alertBG.isHidden = false
        alertOptions.isHidden = false
    }
    
    func hideAlert2() {
        alertBG.isHidden = true
        alertOptions_2.isHidden = true
        alertOption2CenterYConstraint.constant = 600
        alertBGTopConstraint.constant = UIScreen.main.bounds.height
    }
    
    func showAlert2() {
        alertOption2CenterYConstraint.constant = 0
        alertBGTopConstraint.constant = 0
        alertBG.isHidden = false
        alertOptions_2.isHidden = false
    }
    
    
    
    
    
}

extension ProfileVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileVC_TableCell") as? ProfileVC_TableCell else {return TrendingRestaurantsTabelCell()}
        cell.optionButtonDelegate = self
        return cell
    }
    
}

extension ProfileVC: OptionButtonDelegate {
    func didTappedOptionButton() {
        //        CustomAlertOptions.instance.showAlert()
        showAlert1()
    }
    
}
