//
//  EditReviewVC.swift
//  Foody_Bite
//
//  Created by Usama Sadiq on 3/12/20.
//  Copyright © 2020 Usama Sadiq. All rights reserved.
//

import UIKit

class EditReviewVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func backButtonTapped(_ sender: Any) {
         navigationController?.popViewController(animated: true)
    }
    @IBAction func updateButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func ratingStarTapped1(_ sender: UIButton) {
    }

}
