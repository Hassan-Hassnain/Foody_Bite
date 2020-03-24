//
//  NotificationVC.swift
//  Foody_Bite
//
//  Created by Usama Sadiq on 3/8/20.
//  Copyright © 2020 Usama Sadiq. All rights reserved.
//

import UIKit

class NotificationVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.regCell(cellName: NotificationVCTableViewCell.className)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = false
    }
    
    @IBAction func homeButtonTapped(_ sender: Any) {
        goTo(fromStoryboar: Storyboards.main, toVC: HomeVC.className, animate: false)
    }
    @IBAction func favoriteButtonTapped(_ sender: Any) {
        goTo(fromStoryboar: Storyboards.main, toVC: MyFavoriteVC.className, animate: false)
    }
    @IBAction func notificationButtonTapped(_ sender: Any) {
    }
    @IBAction func profileButtonTapped(_ sender: Any) {
        goTo(fromStoryboar: Storyboards.main, toVC: ProfileVC.className, animate: false)
    }


}
extension NotificationVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NotificationVCTableViewCell.className) as? NotificationVCTableViewCell else { return NotificationVCTableViewCell()}
        
        
        return cell
    }
    
 
    
}

