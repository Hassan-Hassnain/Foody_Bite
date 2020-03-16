//
//  FollowersVC.swift
//  Foody_Bite
//
//  Created by Usama Sadiq on 3/8/20.
//  Copyright © 2020 Usama Sadiq. All rights reserved.
//

import UIKit

class FollowersVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        dismissDetail()
    }
    
    
    
}

extension FollowersVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FindFriendCell_Suggestions") as? FindFriendCell_Suggestions else {return FindFriendCell_Suggestions()}
        cell.friendName.text = "Muhammad Hassan"
        cell.buttonColorView.backgroundFillColor = UIColor.red
       
        return cell
    }
    //        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //            guard let vc = storyboard?.instantiateViewController(identifier: "OtherUserProfileVC") as? OtherUserProfileVC else {return}
    //            vc.modalPresentationStyle = .fullScreen
    //            presentDetail(vc)
    //        }
    
}
