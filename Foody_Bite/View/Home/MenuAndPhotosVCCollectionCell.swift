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
    
    // mainView is my custom parent view, that contains every other component of the cell
        
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Add width constraint if you want dynamic height
        
        foodImageView.translatesAutoresizingMaskIntoConstraints = true
        foodImageView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.width / 3).isActive = true
    }
    
    func configure(foodImage image: UIImage) {
        self.foodImageView.image = image
    }
}
