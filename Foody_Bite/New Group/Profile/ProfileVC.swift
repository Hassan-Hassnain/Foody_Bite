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
        guard let vc = storyboard?.instantiateViewController(identifier: "HomeVC") as? HomeVC else {return}
        vc.modalPresentationStyle = .fullScreen
        presentDetail(vc)
    }
    @IBAction func favoriteButtonTapped(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(identifier: "MyFavoriteVC") as? MyFavoriteVC else {return}
        vc.modalPresentationStyle = .fullScreen
        presentDetail(vc)
    }
    @IBAction func notificationButtonTapped(_ sender: Any) {
        print("Notification button tapped")
        guard let vc = storyboard?.instantiateViewController(identifier: "NotificationVC") as? NotificationVC else {return}
        vc.modalPresentationStyle = .fullScreen
        presentDetail(vc)
    }
    @IBAction func profileButtonTapped(_ sender: Any) {
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(identifier: "NewReviewVC") as? NewReviewVC else {return}
        vc.modalPresentationStyle = .fullScreen
        presentDetail(vc)
    }
    @IBAction func reviewsButtonTapped(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(identifier: "ReviewsVC") as? ReviewsVC else {return}
        vc.modalPresentationStyle = .fullScreen
        presentDetail(vc)
    }
    @IBAction func followersButtonTapped(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(identifier: "FollowersVC") as? FollowersVC else {print("returned from FollowersVC"); return}
        vc.modalPresentationStyle = .fullScreen
        presentDetail(vc)
    }
    @IBAction func followingButtonTapped(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(identifier: "FollowingVC") as? FollowingVC else {return}
        vc.modalPresentationStyle = .fullScreen
        presentDetail(vc)
    }
    @IBAction func settingsButtonTapped(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(identifier: "SettingsVC") as? SettingsVC else {return}
        vc.modalPresentationStyle = .fullScreen
        presentDetail(vc)
    }
//MARK: - Alert functions
  
    @IBAction func editButtonTapped(_ sender: Any) {
        print("Edit Button Clicked")
        hideAlert1()
    }
    @IBAction func deletButtonTapped(_ sender: Any) {
        print("Delete Button Clicked")
        hideAlert1()
        showAlert2()
    }
    @IBAction func cancelButtonTapped(_ sender: Any) {
        print("Cancel Button Clicked")
        hideAlert1()
    }
    
    
      func hideAlert1() {
          alertBG.isHidden = true
          alertOptions.isHidden = true
      }
      func showAlert1() {
          alertBG.isHidden = false
          alertOptions.isHidden = false
      }
    
    
    @IBAction func noButtonTapped(_ sender: Any) {
        print("No Button Clicked")
        hideAlert2()
    }
    @IBAction func yesButtonTapped(_ sender: Any) {
        print("Yes Button Clicked")
        hideAlert2()
    }
    
    func hideAlert2() {
        alertBG.isHidden = true
        alertOptions_2.isHidden = true
    }
    
    func showAlert2() {
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
        optionButtonWasTapped()
    }
    
    func optionButtonWasTapped() {
//        print("Option Will show")
//        CustomAlertOptions.instance.showAlert()
//        print("Option did show")
        
        
        showAlert1()
    }
    
}
