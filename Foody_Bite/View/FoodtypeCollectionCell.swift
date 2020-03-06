//
//  FoodtypeCollectionCell.swift
//  Foody_Bite
//
//  Created by Usama Sadiq on 3/6/20.
//  Copyright © 2020 Usama Sadiq. All rights reserved.
//

import UIKit

class FoodtypeCollectionCell: UICollectionViewCell {
    @IBOutlet weak var foodImageView: UIImageView!
    
    func configure(foodImage image: UIImage) {
        foodImageView.image = image
    }
    
}
