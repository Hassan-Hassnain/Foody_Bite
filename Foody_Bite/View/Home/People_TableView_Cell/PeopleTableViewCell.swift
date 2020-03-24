//
//  PeopleTableViewCell.swift
//  Foody_Bite
//
//  Created by Usama Sadiq on 3/22/20.
//  Copyright © 2020 Usama Sadiq. All rights reserved.
//

import UIKit

class PeopleTableViewCell: UITableViewCell {

    @IBOutlet weak var friendImageView: UIImageView!
        @IBOutlet weak var friendName: UILabel!
        @IBOutlet weak var reviewLabel: UILabel!
        @IBOutlet weak var buttonColorView: UIView!
        @IBOutlet weak var followButton: UIButton!
        override func awakeFromNib() {
            super.awakeFromNib()
            // Initialization code
        }

    
        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)

        }

        func configure(firendImage image: UIImage, friendName name: String, totalReview review: String) {
            self.friendImageView.image = image
            self.friendName.text = name
            self.reviewLabel.text = review
        }
        @IBAction func followButtonWasPressed(_ sender: Any) {
        }
    }
