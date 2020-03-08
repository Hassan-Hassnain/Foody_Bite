//
//  NewReview_2.swift
//  Foody_Bite
//
//  Created by Usama Sadiq on 3/8/20.
//  Copyright © 2020 Usama Sadiq. All rights reserved.
//

import UIKit

class NewReview_2: UIViewController {
    
    @IBOutlet weak var searchField: UITextFieldX!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setSearchFieldLeftButton()
    }
    @IBAction func addButtonTapped(_ sender: Any) {
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        dismissDetail()
    }
    
    @IBAction func postButtonTapped(_ sender: Any) {
    }
    @IBAction func homeButtonTapped(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(identifier: "HomeVC") as? HomeVC else {return}
        vc.modalPresentationStyle = .fullScreen
        presentDetail(vc)
    }
    @IBAction func favoriteButtonTapped(_ sender: Any) {
        guard let trendingRestaurentsVC = storyboard?.instantiateViewController(identifier: "MyFavoriteVC") as? MyFavoriteVC else {return}
        trendingRestaurentsVC.modalPresentationStyle = .fullScreen
        self.presentDetail(trendingRestaurentsVC)
    }
    @IBAction func notificationButtonTapped(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(identifier: "NotificationVC") as? NotificationVC else {return}
        vc.modalPresentationStyle = .fullScreen
        presentDetail(vc)
    }
    @IBAction func profileButtonTapped(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(identifier: "ProfileVC") as? ProfileVC else {return}
               vc.modalPresentationStyle = .fullScreen
               self.presentDetail(vc)
    }
    @IBAction func closeButtonTapped(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(identifier: "HomeVC") as? HomeVC else {return}
        vc.modalPresentationStyle = .fullScreen
        presentDetail(vc)
    }
    
    //MARK: - SEARCH FIELD RIGHT BUTTON
    func setSearchFieldLeftButton() {
        
        var view: UIView
        let button = UIButton(frame: CGRect(x: 20, y: 0, width: 20, height: 20))
        button.setImage(UIImage(named: "Icon_Search_grey.png"), for: .normal)
        // Note: In order for your image to use the tint color, you have to select the image in the Assets.xcassets and change the "Render As" property to "Template Image".
        button.tintColor = searchField.tintColor
        
        var width = button.frame.width + 20
        
        if searchField.borderStyle == UITextField.BorderStyle.none || searchField.borderStyle == UITextField.BorderStyle.line {
            width += 5
        }
        view = UIView(frame: CGRect(x: 0, y: 0, width: width, height: 20))
        button.addTarget(self, action: #selector(filterButtonAction), for: .touchUpInside)
        view.addSubview(button)
        searchField.leftView = view
    }
    @objc func filterButtonAction() {
        // code for search field leftview button
        print("SearchField search button tapped")
    }
    
}

extension NewReview_2: UITextFieldDelegate {
    
}