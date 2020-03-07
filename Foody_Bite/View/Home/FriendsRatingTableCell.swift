//
//  FriendsRatingTableCell.swift
//  Foody_Bite
//
//  Created by Usama Sadiq on 3/6/20.
//  Copyright © 2020 Usama Sadiq. All rights reserved.
//

import UIKit
import Dezignables

class FriendsRatingTableCell: UITableViewCell {

    @IBOutlet weak var friendImageView: DezignableImageView!
    @IBOutlet weak var friendNameLabel: UILabel!
    @IBOutlet weak var commentsLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func confiture(visitorImage image: UIImage, visitorName name: String, visitorComments comments: String, visitorRating rating: String ) {
        friendImageView.image = image
        friendNameLabel.text = name
        commentsLabel.text = comments
        ratingLabel.text = rating
    }

}
