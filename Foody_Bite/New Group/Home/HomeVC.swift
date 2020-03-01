//
//  HomeVC.swift
//  Foody_Bite
//
//  Created by Usama Sadiq on 3/2/20.
//  Copyright © 2020 Usama Sadiq. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    
    @IBOutlet weak var restaurantCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        restaurantCollectionView.dataSource = self
        restaurantCollectionView.delegate = self
    }
    

}

extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TrendingRestaurantsCell", for: indexPath) as? TrendingRestaurantsCell else {return TrendingRestaurantsCell()}
//        cell.configure(openingStatus: <#T##String#>, restaurantRating: <#T##String#>, resturantImage: <#T##UIImage#>, restaurantName: <#T##String#>, foodType: <#T##String#>, restaurantDistance: <#T##String#>, restaurantAddress: <#T##String#>, visitorsImage: <#T##[UIImage]#>)
        return cell
    }
    
    
}
