//
//  OtherUserProfileVC.swift
//  Foody_Bite
//
//  Created by Usama Sadiq on 3/7/20.
//  Copyright © 2020 Usama Sadiq. All rights reserved.
//

import UIKit

class OtherUserProfileVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var followBtn: Custom_UIButton!
    @IBOutlet weak var blockBtn: Custom_UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.regCell(cellName: RestaurantCellTableViewCell.className)
        
        tableView.dataSource = self
        tableView.delegate = self
        
        followBtn.updateUI()
        blockBtn.updateUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
    }
    
    
    @IBAction func backButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        
    }
    
    
}

extension OtherUserProfileVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RestaurantCellTableViewCell.className) as? RestaurantCellTableViewCell else {return RestaurantCellTableViewCell()}
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.customPush(TrendingRestaurantItemDetailsVC.className, animate: true)
    }
    
    
}
