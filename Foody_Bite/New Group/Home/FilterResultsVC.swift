//
//  FilterResultsVC.swift
//  Foody_Bite
//
//  Created by Usama Sadiq on 3/7/20.
//  Copyright © 2020 Usama Sadiq. All rights reserved.
//

import UIKit

class FilterResultsVC: UIViewController {

     @IBOutlet weak var tableView: UITableView!
        @IBOutlet weak var searchBar: UITextFieldX!
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            tableView.delegate = self
            tableView.dataSource = self
            setSearchFieldRightButton()
        }
        

        //MARK: - SEARCH FIELD RIGHT BUTTON
        func setSearchFieldRightButton() {
            
            var view: UIView
            let button = UIButton(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
            button.setImage(UIImage(named: "Icon_Close_Grey.png"), for: .normal)
            // Note: In order for your image to use the tint color, you have to select the image in the Assets.xcassets and change the "Render As" property to "Template Image".
            button.tintColor = searchBar.tintColor
            
            var width = button.frame.width + 20
            
            if searchBar.borderStyle == UITextField.BorderStyle.none || searchBar.borderStyle == UITextField.BorderStyle.line {
                width += 5
            }
            view = UIView(frame: CGRect(x: 0, y: 0, width: width, height: 20))
            button.addTarget(self, action: #selector(filterButtonAction), for: .touchUpInside)
            view.addSubview(button)
            searchBar.rightView = view
        }
        @objc func filterButtonAction() {
//            guard let filter = storyboard?.instantiateViewController(identifier: "FilterResultsVC") as? FilterResultsVC else {return}
//            filter.modalPresentationStyle = .fullScreen
//            presentDetail(filter)
            dismissDetail()
        }
        
        
    }

    extension FilterResultsVC: UITableViewDataSource, UITableViewDelegate {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 10
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TrendingRestaurantsTabelCell") as? TrendingRestaurantsTabelCell else {return TrendingRestaurantsTabelCell()}
            
            return cell
        }
        
        
    }
