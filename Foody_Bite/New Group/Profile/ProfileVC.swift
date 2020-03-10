//
//  ProfileVC.swift
//  Foody_Bite
//
//  Created by Usama Sadiq on 3/8/20.
//  Copyright © 2020 Usama Sadiq. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
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
        // create the alert
        let alert = UIAlertController(title: "", message: "", preferredStyle: UIAlertController.Style.alert)
        let color: UIColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
        let messageAttributes = [NSAttributedString.Key.font: UIFont(name: "Helvetica", size: 25)!, NSAttributedString.Key.foregroundColor: color]
        let messageString = NSAttributedString(string: "Are you sure you want to logout?", attributes: messageAttributes)
        alert.setValue(messageString, forKey: "attributedMessage")
        // add the actions (buttons)
        
        alert.addAction(UIAlertAction(title: "Continue", style: UIAlertAction.Style.default, handler: nil))
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: nil))
        alert.addAction(UIAlertAction(title: "edit", style: UIAlertAction.Style.default, handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
        
        print("ProfileVC")
    }
    
}
