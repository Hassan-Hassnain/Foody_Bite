//
//  ProfileVC_TableCell.swift
//  Foody_Bite
//
//  Created by Usama Sadiq on 3/10/20.
//  Copyright © 2020 Usama Sadiq. All rights reserved.
//

import UIKit
import Dezignables



class ProfileVC_TableCell: UITableViewCell {
    
    @IBOutlet weak var openingStatusLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var restaurantsImageView: UIImageView!
    @IBOutlet weak var restaurantName: UILabel!
    @IBOutlet weak var foodTypeLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var visitorImage1: DezignableImageView!
    @IBOutlet weak var visitorImage2: DezignableImageView!
    @IBOutlet weak var visitorImage3: DezignableImageView!
    @IBOutlet weak var visitorImage4: DezignableImageView!
    @IBOutlet weak var totalVisitorsLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var optionsButton: UIButton!
    
    var visitors:[UIImage] = []
    
    var optionButtonDelegate: OptionButtonDelegate?
    
    func setImages() {
        for visitor in 0...3 {
            if visitors.count >= visitor {
                visitorImage1.image = visitors[visitor]
                if visitors.count > visitor {
                    totalVisitorsLabel.isHidden = false
                    totalVisitorsLabel.text = String(describing: visitors.count)
                } else {
                    totalVisitorsLabel.isHidden = true
                }
            }
        }
    }
    
    func configure(openingStatus status: String, restaurantRating rating: String, resturantImage image: UIImage, restaurantName name: String, foodType type: String, restaurantDistance distance: String, restaurantAddress address: String, visitorsImage visitorsArray: [UIImage]) {
        self.openingStatusLabel.text = status
        self.ratingLabel.text = rating
        self.restaurantsImageView.image = image
        self.restaurantName.text = name
        self.foodTypeLabel.text = type
        self.distanceLabel.text = distance
        self.addressLabel.text = address
        visitors = visitorsArray
        setImages()
    }
    
    @IBAction func optionsButtonTapped(_ sender: UIButton) {
        optionButtonDelegate?.didTappedOptionButton()
    }
    
    
    
    
    
}
