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
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var friendsCollectionView: UICollectionView!
    
    @IBOutlet weak var totalRestaurantLabel: UIButton!
    @IBOutlet weak var totalCategoryLabel: UIButton!
    @IBOutlet weak var totalFriendLabel: UIButton!
    
    @IBOutlet weak var searchField: Custom_UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        restaurantCollectionView.dataSource = self
        restaurantCollectionView.delegate = self
        
        categoryCollectionView.dataSource = self
        categoryCollectionView.delegate = self
        
        friendsCollectionView.dataSource = self
        friendsCollectionView.delegate = self
        
        searchField.delegate = self
        searchField.rightButton?.addTarget(self, action: #selector(filterButtonAction), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = false
    }
    
    //MARK: - LABEL GESTURES
    
    @IBAction func seeAllRestaurantsButtonTapped(_ sender: Any) {
        navigationController?.customPush(TrendingRestaurantsVC.className, animate: true)
    }
    @IBAction func seeAllCatagoriesButtonTapped(_ sender: Any) {
        navigationController?.customPush(FilterVC.className, animate: true)
    }
    @IBAction func seeAllFriendsButtonTapped(_ sender: Any) {
        navigationController?.customPush(FindFriendsVC.className, animate: true)
    }
    
    @objc func filterButtonAction() {
        navigationController?.customPush(FilterResultsVC.className, animate: true)
    }
    
}

extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == restaurantCollectionView {
            return 10
        } else if collectionView == categoryCollectionView {
            return 9
        } else {
            return 15
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == restaurantCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TrendingRestaurantsCell.className, for: indexPath) as? TrendingRestaurantsCell else {return TrendingRestaurantsCell()}
            
            return cell
        } else if collectionView == categoryCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.className, for: indexPath) as? CategoryCell else {return CategoryCell()}
            
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: VisitorsCell.className, for: indexPath) as? VisitorsCell else {return VisitorsCell()}
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if collectionView == restaurantCollectionView {
          navigationController?.customPush(TrendingRestaurantItemDetailsVC.className, animate: true)
        } else if collectionView == categoryCollectionView {
           navigationController?.customPush(CategoriesVC.className, animate: true)
        } else {
            
        }
    }
    
    
}

extension HomeVC: UITextFieldDelegate {
    
}
