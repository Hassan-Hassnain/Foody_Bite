//
//  CategoryCell.swift
//  Foody_Bite
//
//  Created by Usama Sadiq on 3/2/20.
//  Copyright © 2020 Usama Sadiq. All rights reserved.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    
    @IBOutlet weak var foodImageView: UIImageView!
    @IBOutlet weak var categoryTitle: UILabel!
    
    func configure(foodImage image: UIImage, categoryTitle title: String) {
        self.foodImageView.image = image
        self.categoryTitle.text = title
    }
    
}
