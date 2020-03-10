//
//  ChangeLanguageVCTableCell.swift
//  Foody_Bite
//
//  Created by Usama Sadiq on 3/9/20.
//  Copyright © 2020 Usama Sadiq. All rights reserved.
//

import UIKit

class ChangeLanguageVCTableCell: UITableViewCell {

   
    @IBOutlet weak var languageLabel: UILabel!
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
        print("Button pressed")
    }
    
    func configure(languageTitle title: String, buttonImage image: UIImage?) {
        languageLabel.text = title
        if let image = image {
            self.selectionImage.image = image
        }
    }
    
}
