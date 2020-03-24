//
//  CategoriesVC.swift
//  Foody_Bite
//
//  Created by Usama Sadiq on 3/7/20.
//  Copyright © 2020 Usama Sadiq. All rights reserved.
//

import UIKit
import ChameleonFramework

class CategoriesVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var categories = DataService.instance.categores + DataService.instance.categores
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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

extension CategoriesVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell0 = tableView.dequeueReusableCell(withIdentifier: "CategorVCTableCell0") as? CategorVCTableCell else {return CategorVCTableCell()}

        cell0.gradientLayer.topColor = RandomFlatColor().lighten(byPercentage: 50)
        cell0.gradientLayer.bottomColor = RandomFlatColor().lighten(byPercentage: 50)
        
        return cell0
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let animation = CATransform3DMakeTranslation(UIScreen.main.bounds.size.width, 0, 0)
        cell.layer.transform = animation
        
        UIView.animate(withDuration: 0.8){
            cell.layer.transform = CATransform3DIdentity
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.customPush(CategoryDetailsVC.className, animate: true)
    }
}
