//
//  ProfileVC.swift
//  Foody_Bite
//
//  Created by Usama Sadiq on 3/8/20.
//  Copyright © 2020 Usama Sadiq. All rights reserved.
//

import UIKit
import Firebase

class ProfileVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var alertBG: UIView!
    @IBOutlet weak var alertOptions: Custom_UIView!
    @IBOutlet weak var alertOptions_2: Custom_UIView!
    @IBOutlet weak var editButton: Custom_UIButton!
    @IBOutlet weak var settingButton: Custom_UIButton!
    @IBOutlet weak var alertOption1CenterYConstraint: NSLayoutConstraint!
    @IBOutlet weak var alertOption2CenterYConstraint: NSLayoutConstraint!
    @IBOutlet weak var alertBGTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileImageView.round()
        alertOptions.cornerRadius = 25
        alertOptions_2.cornerRadius = 25
        tableView.regCell(cellName: RestaurantCellTableViewCell.className)
        
        editButton.layer.cornerRadius = 10
        tableView.dataSource = self
        tableView.delegate = self
        
        hideAlert1()
        hideAlert2()
        editButton.updateUI()
        settingButton.updateUI()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateFoodyUser()
    }
    
    @IBAction func reviewsButtonTapped(_ sender: Any) {
        navigationController?.customPush(ReviewsVC.className, animate: true)
    }
    @IBAction func followersButtonTapped(_ sender: Any) {
        navigationController?.customPush(FollowersVC.className, animate: true)
    }
    @IBAction func followingButtonTapped(_ sender: Any) {
        navigationController?.customPush(FollowingVC.className, animate: true)
    }
    @IBAction func EditProfileButtonTapped(_ sender: Any) {
        navigationController?.customPush(EditProfileVC.className, animate: true)
    }
    @IBAction func settingsButtonTapped(_ sender: Any) {
        navigationController?.customPush(SettingsVC.className, animate: true)
    }
    
    //MARK: - Alert functions and Actions
    @IBAction func editButtonTapped(_ sender: Any) {
        //        hideAlert1()
        navigationController?.customPush(EditReviewVC.className, animate: true)
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
    
    
    private func hideAlert1() {
        alertBG.isHidden = true
        alertOptions.isHidden = true
        alertOption1CenterYConstraint.constant = 600
        alertBGTopConstraint.constant = UIScreen.main.bounds.height
    }
    
    private func showAlert1() {
        alertOption1CenterYConstraint.constant = 0
        alertBGTopConstraint.constant = 0
        alertBG.isHidden = false
        alertOptions.isHidden = false
    }
    
    private func hideAlert2() {
        alertBG.isHidden = true
        alertOptions_2.isHidden = true
        alertOption2CenterYConstraint.constant = 600
        alertBGTopConstraint.constant = UIScreen.main.bounds.height
    }
    
    private func showAlert2() {
        alertOption2CenterYConstraint.constant = 0
        alertBGTopConstraint.constant = 0
        alertBG.isHidden = false
        alertOptions_2.isHidden = false
    }
    private func updateFoodyUser() {
        DataService.instance.getUserData(forUID: Auth.auth().currentUser!.uid) { (user) in
            self.nameLabel.text = user.name
            self.emailLabel.text = user.email
            print(user.imageUrl)
            self.profileImageView.load(from: user.imageUrl)
            
        }
    }
    
    
    
    
    
    
}

extension ProfileVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RestaurantCellTableViewCell.className) as? RestaurantCellTableViewCell else {return RestaurantCellTableViewCell()}
        //        cell.optionButtonDelegate = self
        return cell
    }
    
}

extension ProfileVC: OptionButtonDelegate {
    func didTappedOptionButton() {
        //        CustomAlertOptions.instance.showAlert()
        showAlert1()
    }
    
}
