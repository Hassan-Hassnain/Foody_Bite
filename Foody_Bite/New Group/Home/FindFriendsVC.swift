//
//  FindFriendsVC.swift
//  Foody_Bite
//
//  Created by Usama Sadiq on 3/7/20.
//  Copyright © 2020 Usama Sadiq. All rights reserved.
//

import UIKit

class FindFriendsVC: UIViewController {
    
    var sections = ["Contacts", "Suggestions"]
    var contacts = ["1","2","3"]
    var suggestions = ["1","2","3"]
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.regCell(cellName: PeopleTableViewCell.className)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
    }
    
    
    @IBAction func backButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
    
}

extension FindFriendsVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let contactView = tableView.dequeueReusableCell(withIdentifier: Header.CONTACTS)
        let suggestionView = tableView.dequeueReusableCell(withIdentifier: Header.SUGGESTIONS)
        
        if section == 0 {
            return contactView
        } else {
            return suggestionView
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 49.3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return contacts.count
        } else {
            return suggestions.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PeopleTableViewCell.className) as? PeopleTableViewCell else {return PeopleTableViewCell()}
        return cell
    }
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            navigationController?.customPush(OtherUserProfileVC.className, animate: true)
        }
      
    
}
