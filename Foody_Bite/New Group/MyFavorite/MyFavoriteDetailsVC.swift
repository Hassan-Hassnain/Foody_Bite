//
//  MyFavoriteDetailsVC.swift
//  Foody_Bite
//
//  Created by Usama Sadiq on 3/8/20.
//  Copyright © 2020 Usama Sadiq. All rights reserved.
//

import UIKit

class MyFavoriteDetailsVC: UIViewController {

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
        dismissDetail()
    }
    


}

extension MyFavoriteDetailsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsRatingTableCell") as? FriendsRatingTableCell else {return FriendsRatingTableCell()}
        print("Cell return \(indexPath.row)")
        return cell
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//        guard let vc = storyboard?.instantiateViewController(identifier: "TrendingRestaurantItemDetailsVC") as? TrendingRestaurantItemDetailsVC else {return}
//        vc.modalPresentationStyle = .fullScreen
//        presentDetail(vc)
//    }
    
    
}

extension MyFavoriteDetailsVC: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FoodtypeCollectionCell", for: indexPath) as? FoodtypeCollectionCell else { return FoodtypeCollectionCell()}
        
        
        return cell
    }
    
    
}
