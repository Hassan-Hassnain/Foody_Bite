//
//  EditReviewVC.swift
//  Foody_Bite
//
//  Created by Usama Sadiq on 3/12/20.
//  Copyright © 2020 Usama Sadiq. All rights reserved.
//

import UIKit

class EditReviewVC: UIViewController {
    
    @IBOutlet weak var ratingStar1: UIButton!
    @IBOutlet weak var ratingStar2: UIButton!
    @IBOutlet weak var ratingStar3: UIButton!
    @IBOutlet weak var ratingStar4: UIButton!
    @IBOutlet weak var ratingStar5: UIButton!
    
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
