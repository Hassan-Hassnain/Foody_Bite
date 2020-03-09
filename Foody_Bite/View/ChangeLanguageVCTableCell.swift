//
//  ChangeLanguageVCTableCell.swift
//  Foody_Bite
//
//  Created by Usama Sadiq on 3/9/20.
//  Copyright © 2020 Usama Sadiq. All rights reserved.
//

import UIKit

class ChangeLanguageVCTableCell: UITableViewCell {

    @IBOutlet weak var languageButton: UIButton!
    @IBOutlet weak var selectionImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func languageButtonTapped(_ sender: Any) {
    }
    
    func configure(languageTitle title: String, buttonImage image: UIImage) {
        self.languageButton.setTitle(title, for: .normal)
        self.selectionImage.image = image
    }
    
}
