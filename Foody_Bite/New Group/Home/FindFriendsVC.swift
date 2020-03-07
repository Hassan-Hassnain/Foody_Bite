//
//  FindFriendsVC.swift
//  Foody_Bite
//
//  Created by Usama Sadiq on 3/7/20.
//  Copyright © 2020 Usama Sadiq. All rights reserved.
//

import UIKit

class FindFriendsVC: UIViewController {
    
    @IBOutlet weak var contactsTableView: UITableView!
    @IBOutlet weak var suggestionsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contactsTableView.delegate = self
        contactsTableView.dataSource = self
        suggestionsTableView.delegate = self
        suggestionsTableView.dataSource = self
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        dismissDetail()
    }
    
    
    
}

extension FindFriendsVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == contactsTableView {
            return 10
        } else {
            return 10
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == contactsTableView {
                    guard let cell = tableView.dequeueReusableCell(withIdentifier: "FindFriendCell_Contacts") as? FindFriendCell_Contacts else {return FindFriendCell_Contacts()}
                    
                    return cell
                } else {
                    guard let cell = tableView.dequeueReusableCell(withIdentifier: "FindFriendCell_Suggestions") as? FindFriendCell_Suggestions else {return FindFriendCell_Suggestions()}
                    
                    return cell
                }
    }
  
    
}
