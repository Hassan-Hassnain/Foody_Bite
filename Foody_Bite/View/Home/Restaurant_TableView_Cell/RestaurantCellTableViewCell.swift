//
//  RestaurantCellTableViewCell.swift
//  Foody_Bite
//
//  Created by Usama Sadiq on 3/21/20.
//  Copyright © 2020 Usama Sadiq. All rights reserved.
//

import UIKit

class RestaurantCellTableViewCell: UITableViewCell {

      
      @IBOutlet weak var openingStatusLabel: UILabel!
      @IBOutlet weak var ratingLabel: UILabel!
      @IBOutlet weak var restaurantsImageView: UIImageView!
      @IBOutlet weak var restaurantName: UILabel!
      @IBOutlet weak var foodTypeLabel: UILabel!
      @IBOutlet weak var distanceLabel: UILabel!
      @IBOutlet weak var visitorImage1: Custom_UIImageView!
      @IBOutlet weak var visitorImage2: Custom_UIImageView!
      @IBOutlet weak var visitorImage3: Custom_UIImageView!
      @IBOutlet weak var visitorImage4: Custom_UIImageView!
      @IBOutlet weak var totalVisitorsLabel: UILabel!
      @IBOutlet weak var addressLabel: UILabel!
      @IBOutlet weak var optionsButton: UIButton!
      
      var visitors:[UIImage] = []
      
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
          self.distanceLabel.text = "\(distance) km"
          self.addressLabel.text = address
          visitors = visitorsArray
          setImages()
      }
      func configure(restaurant: Restaurant) {
          self.openingStatusLabel.text = restaurant.openingStatus
          self.ratingLabel.text = restaurant.rating
          self.restaurantName.text = restaurant.restaurantName
          self.foodTypeLabel.text = restaurant.foodType
          self.distanceLabel.text = "\(restaurant.distance) km"
          self.addressLabel.text = restaurant.address
          if let images = restaurant.visitorImages {
              visitors = images
              setImages()
          }
          
          if let image = restaurant.restaurantsImage {
              self.restaurantsImageView.image = image
          }
      }
      @IBAction func optionsButtonTapped(_ sender: Any) {
          print("TrendingRestaurantTableCell button tapped")
      }
      
}
