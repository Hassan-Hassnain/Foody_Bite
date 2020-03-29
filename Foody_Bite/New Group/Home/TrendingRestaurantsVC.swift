//
//  TrendingRestaurantsVC.swift
//  Foody_Bite
//
//  Created by Usama Sadiq on 3/2/20.
//  Copyright © 2020 Usama Sadiq. All rights reserved.
//

import UIKit

class TrendingRestaurantsVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: Custom_UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.regCell(cellName: RestaurantCellTableViewCell.className)
        tableView.delegate = self
        tableView.dataSource = self
        
        searchBar.rightButton?.addTarget(self, action: #selector(textFieldRightButtonAction), for: .touchUpInside)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
    }
    
    
    @IBAction func closeButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: false)
    }
    
    @objc func textFieldRightButtonAction() {
        navigationController?.customPush(FilterResultsVC.className, animate: true)
    }
    
    
}

extension TrendingRestaurantsVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RestaurantCellTableViewCell.className) as? RestaurantCellTableViewCell else {return RestaurantCellTableViewCell()}
        cell.optionsButton.isHidden = true
        
        let restaurant = Restaurant(openingStatus: "Open", rating: "4.5", restaurantsImage: nil, restaurantName: "KFC", foodType: "Custom", distance: "3.2", visitorImages: nil, totalVisitors: "25", address: "Lahore")
        
        cell.configure(restaurant: restaurant)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       navigationController?.customPush(TrendingRestaurantItemDetailsVC.className, animate: true)
    }
    
}
