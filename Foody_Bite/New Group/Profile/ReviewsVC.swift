//
//  ReviewsVC.swift
//  Foody_Bite
//
//  Created by Usama Sadiq on 3/8/20.
//  Copyright © 2020 Usama Sadiq. All rights reserved.
//

import UIKit

class ReviewsVC: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    @IBAction func backButtonTapped(_ sender: Any) {
        dismissDetail()
    }
    
    
    
    
}

extension ReviewsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AllReviewAndRatingVCTableCell") as? AllReviewAndRatingVCTableCell else { return AllReviewAndRatingVCTableCell()}
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
