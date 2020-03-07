//
//  VisitorsCell.swift
//  Foody_Bite
//
//  Created by Usama Sadiq on 3/2/20.
//  Copyright © 2020 Usama Sadiq. All rights reserved.
//

import UIKit
import Dezignables

class VisitorsCell: UICollectionViewCell {
    
    @IBOutlet weak var visitorImage: DezignableImageView!
    
    func configure(visitorImage image: UIImage){
        self.visitorImage.image = image
    }
}
