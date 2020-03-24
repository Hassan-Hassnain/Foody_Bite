//
//  VisitorsCell.swift
//  Foody_Bite
//
//  Created by Usama Sadiq on 3/2/20.
//  Copyright © 2020 Usama Sadiq. All rights reserved.
//

import UIKit

class VisitorsCell: UICollectionViewCell {
    
    @IBOutlet weak var visitorImage: UIImageView!
    
    func configure(visitorImage image: UIImage){
        self.visitorImage.image = image
        
    }
    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        visitorImage.round()
//    }
//
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//        visitorImage.round()
//    }
}
