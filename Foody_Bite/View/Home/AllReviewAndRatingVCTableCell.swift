//
//  AllReviewAndRatingVCTableCell.swift
//  Foody_Bite
//
//  Created by Usama Sadiq on 3/8/20.
//  Copyright © 2020 Usama Sadiq. All rights reserved.
//

import UIKit
import Dezignables

class AllReviewAndRatingVCTableCell: UITableViewCell {

    @IBOutlet weak var friendImage: DezignableImageView!
    @IBOutlet weak var friendName: UILabel!
    @IBOutlet weak var comments: UILabel!
    @IBOutlet weak var rating: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(friendsImage image: UIImage, friendName name: String, friendComments comments: String, andRating rating: String) {
        self.friendImage.image = image
        self.friendName.text = name
        self.comments.text = comments
        self.rating.text = rating
    }
}
