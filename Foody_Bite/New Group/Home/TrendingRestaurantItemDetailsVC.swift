//
//  TrendingRestaurantItemDetailsVC.swift
//  Foody_Bite
//
//  Created by Usama Sadiq on 3/6/20.
//  Copyright © 2020 Usama Sadiq. All rights reserved.
//

import UIKit
import Dezignables

class TrendingRestaurantItemDetailsVC: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        //        guard let vc = storyboard?.instantiateViewController(identifier: "TrendingRestaurantsVC") as? TrendingRestaurantsVC else {return}
        //               vc.modalPresentationStyle = .fullScreen
        //               presentDetail(vc)
        dismissDetail()
    }
    @IBAction func rateYourExpierience(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(identifier: "RatingAndReviewVC") as? RatingAndReviewVC else {return}
        vc.modalPresentationStyle = .fullScreen
        presentDetail(vc)
    }
    
    @IBAction func seeAllPhotosButtonTapped(_ sender: Any) {
        
        guard let vc = storyboard?.instantiateViewController(identifier: "MenuAndPhotosVC") as? MenuAndPhotosVC else {return}
        vc.modalPresentationStyle = .fullScreen
        presentDetail(vc)
    }

    
}

extension TrendingRestaurantItemDetailsVC: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FoodtypeCollectionCell", for: indexPath) as? FoodtypeCollectionCell else { return FoodtypeCollectionCell()}
        
        
        return cell
    }
    
    
}

extension TrendingRestaurantItemDetailsVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsRatingTableCell") as? FriendsRatingTableCell else { return FriendsRatingTableCell()}
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(identifier: "AllReviewAndRatingVC") as? AllReviewAndRatingVC else {return}
        vc.modalPresentationStyle = .fullScreen
        presentDetail(vc)
    }
    
    
}
