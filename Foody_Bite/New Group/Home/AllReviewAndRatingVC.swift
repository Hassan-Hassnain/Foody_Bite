//
//  AllReviewAndRatingVC.swift
//  Foody_Bite
//
//  Created by Usama Sadiq on 3/7/20.
//  Copyright © 2020 Usama Sadiq. All rights reserved.
//

import UIKit

class AllReviewAndRatingVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.regCell(cellName: AllReviewAndRatingVCTableCell.className)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    

  

}

extension AllReviewAndRatingVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AllReviewAndRatingVCTableCell.className) as? AllReviewAndRatingVCTableCell else { return AllReviewAndRatingVCTableCell()}
        if indexPath.row == 2 {
            let text = cell.comments.text
            cell.comments.text = "\(String(describing: text)),\(String(describing: text)),\(String(describing: text)),\(String(describing: text))"
            
        }
        if indexPath.row == 3 {
            cell.comments.text = "Testing"
            
        }
        return cell
    }
    
    
}

