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
    
    var categories = DataService.instance.categores + DataService.instance.categores
    
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
            cell0.categoryTitle?.text = categories[indexPath.row]
            return cell0
        case 1:
            cell1.categoryTitle?.text = categories[indexPath.row]
            return cell1
        case 2:
            cell2.categoryTitle?.text = categories[indexPath.row]
            return cell2
        case 3:
            cell3.categoryTitle?.text = categories[indexPath.row]
            return cell3
            
        default:
            return CategorVCTableCell()
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let animation = CATransform3DMakeTranslation(UIScreen.main.bounds.size.width, 0, 0)
        cell.layer.transform = animation
        
        UIView.animate(withDuration: 0.8){
            cell.layer.transform = CATransform3DIdentity
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        goTo(fromStoryboar: Storyboards.home, toVC: "CategoryDetailsVC", animate: true)
    }
}
