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
        guard let vc = storyboard?.instantiateViewController(identifier: "HomeVC") as? HomeVC else {return}
        vc.modalPresentationStyle = .fullScreen
        presentDetail(vc)
    }
    @IBAction func favoriteButtonTapped(_ sender: Any) {
    }
    @IBAction func notificationButtonTapped(_ sender: Any) {
        print("Notification button tapped")
        guard let vc = storyboard?.instantiateViewController(identifier: "NotificationVC") as? NotificationVC else {return}
        vc.modalPresentationStyle = .fullScreen
        presentDetail(vc)
    }
    @IBAction func profileButtonTapped(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(identifier: "ProfileVC") as? ProfileVC else {return}
        vc.modalPresentationStyle = .fullScreen
        self.presentDetail(vc)
    }
    @IBAction func addButtonTapped(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(identifier: "NewReviewVC") as? NewReviewVC else {return}
        vc.modalPresentationStyle = .fullScreen
        presentDetail(vc)
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
        
        guard let vc = storyboard?.instantiateViewController(identifier: "MyFavoriteDetailsVC") as? MyFavoriteDetailsVC else {return}
        vc.modalPresentationStyle = .fullScreen
        presentDetail(vc)
    }
    
}
