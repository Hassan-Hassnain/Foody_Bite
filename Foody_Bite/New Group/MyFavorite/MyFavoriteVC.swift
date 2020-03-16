//
//  MyFavoriteVC.swift
//  Foody_Bite
//
//  Created by Usama Sadiq on 3/8/20.
//  Copyright © 2020 Usama Sadiq. All rights reserved.
//

import UIKit

class MyFavoriteVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    @IBAction func searchButtonTapped(_ sender: Any) {
        
    }
    @IBAction func homeButtonTapped(_ sender: Any) {
        self.goTo(toVC: "HomeVC", animate: false)
    }
    @IBAction func favoriteButtonTapped(_ sender: Any) {
    }
    @IBAction func notificationButtonTapped(_ sender: Any) {
        goTo(toVC: "NotificationVC", animate: false)
    }
    @IBAction func profileButtonTapped(_ sender: Any) {
        goTo(toVC: "ProfileVC", animate: false)
    }
    @IBAction func addButtonTapped(_ sender: Any) {
        goTo(toVC: "NewReviewVC", animate: false)
    }
}
extension MyFavoriteVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TrendingRestaurantsTabelCell") as? TrendingRestaurantsTabelCell else {return TrendingRestaurantsTabelCell()}
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        goTo(toVC: "MyFavoriteDetailsVC", animate: true)
    }
    
}
