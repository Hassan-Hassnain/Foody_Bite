//
//  EditReviewVC.swift
//  Foody_Bite
//
//  Created by Usama Sadiq on 3/12/20.
//  Copyright © 2020 Usama Sadiq. All rights reserved.
//

import UIKit

class EditReviewVC: UIViewController {
    
    @IBOutlet weak var searchField: Custom_UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchField.delegate = self
        searchField.rightButton?.addTarget(self, action: #selector(filterButtonAction), for: .touchUpInside)
        
    }
    //MARK: - SEARCH FIELD RIGHT BUTTON
    @objc func filterButtonAction() {
        navigationController?.popViewController(animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
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
extension EditReviewVC: UITextFieldDelegate{}
