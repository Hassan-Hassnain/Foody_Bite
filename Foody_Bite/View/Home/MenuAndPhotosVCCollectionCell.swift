//
//  MenuAndPhotosVCCollectionCell.swift
//  Foody_Bite
//
//  Created by Usama Sadiq on 3/7/20.
//  Copyright © 2020 Usama Sadiq. All rights reserved.
//

import UIKit

class MenuAndPhotosVCCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var foodImageView: UIImageView!
    
    func configure(foodImage image: UIImage) {
        self.foodImageView.image = image
    }
}
