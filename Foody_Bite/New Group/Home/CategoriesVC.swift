//
//  CategoriesVC.swift
//  Foody_Bite
//
//  Created by Usama Sadiq on 3/7/20.
//  Copyright © 2020 Usama Sadiq. All rights reserved.
//

import UIKit

class CategoriesVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var categories = ["Italian","Chinese","Maxican","Thai","Arabian","Indian","American","Korean","European" ]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        dismissDetail()
    }
    
    
}

extension CategoriesVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell0 = tableView.dequeueReusableCell(withIdentifier: "CategorVCTableCell0") as? CategorVCTableCell else {return CategorVCTableCell()}
        guard let cell1 = tableView.dequeueReusableCell(withIdentifier: "CategorVCTableCell1") as? CategorVCTableCell else {return CategorVCTableCell()}
        guard let cell2 = tableView.dequeueReusableCell(withIdentifier: "CategorVCTableCell2") as? CategorVCTableCell else {return CategorVCTableCell()}
        guard let cell3 = tableView.dequeueReusableCell(withIdentifier: "CategorVCTableCell3") as? CategorVCTableCell else {return CategorVCTableCell()}
        let colorID = indexPath.row % 4
        print(colorID)
        switch colorID {
        case 0:
            return cell0
        case 1:
            return cell1
        case 2:
            return cell2
        case 3:
            return cell3
            
        default:
            return CategorVCTableCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(identifier: "CategoryDetailsVC") as? CategoryDetailsVC else {return}
        vc.modalPresentationStyle = .fullScreen
        presentDetail(vc)
    }
}
