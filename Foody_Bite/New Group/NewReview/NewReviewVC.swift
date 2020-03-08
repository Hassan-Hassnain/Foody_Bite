//
//  NewReviewVC.swift
//  Foody_Bite
//
//  Created by Usama Sadiq on 3/8/20.
//  Copyright © 2020 Usama Sadiq. All rights reserved.
//

import UIKit

class NewReviewVC: UIViewController {

    
    @IBOutlet weak var searchField: UITextFieldX!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchField.delegate = self
        setSearchFieldLeftButton()
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(identifier: "HomeVC") as? HomeVC else {return}
        vc.modalPresentationStyle = .fullScreen
        presentDetail(vc)
    }
    
    @IBAction func favoritButtonTapped(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(identifier: "MyFavoriteVC") as? MyFavoriteVC else {return}
        vc.modalPresentationStyle = .fullScreen
        presentDetail(vc)
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
}

extension NewReviewVC: UITextFieldDelegate {
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
           guard let filter = storyboard?.instantiateViewController(identifier: "NewReview_2") as? NewReview_2 else {return}
           filter.modalPresentationStyle = .fullScreen
           presentDetail(filter)
       }
}

