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
        tableView.regCell(cellName: AllReviewAndRatingVCTableCell.className)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
    }
    
    
    @IBAction func backButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}





extension MyFavoriteDetailsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AllReviewAndRatingVCTableCell.className) as? AllReviewAndRatingVCTableCell else {return AllReviewAndRatingVCTableCell()}
       
        return cell
    }
    
    
    
}

extension MyFavoriteDetailsVC: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FoodtypeCollectionCell.className, for: indexPath) as? FoodtypeCollectionCell else { return FoodtypeCollectionCell()}
        
        
        return cell
    }
    
    
}
