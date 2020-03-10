//
//  ChangeLanguageVC.swift
//  Foody_Bite
//
//  Created by Usama Sadiq on 3/9/20.
//  Copyright © 2020 Usama Sadiq. All rights reserved.
//

import UIKit

class ChangeLanguageVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var currentIndex = 0
    var languages = ["English", "Chinese", "Spanish","Urdu", "Hindu", "Arabic","Portuguese","Russian","Japanese","French","German"]
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    }
    @IBAction func backButtonTapped(_ sender: Any) {
        dismissDetail()
    }
    @IBAction func updateButtonTapped(_ sender: Any) {
        dismissDetail()
    }
    

}

extension ChangeLanguageVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return languages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ChangeLanguageVCTableCell") as? ChangeLanguageVCTableCell else {return ChangeLanguageVCTableCell()}
        
        if currentIndex == indexPath.row {
            cell.configure(languageTitle: languages[indexPath.row], buttonImage: UIImage(named: "Icon_Ok_Blue.png"))
        } else {
            cell.configure(languageTitle: languages[indexPath.row], buttonImage: UIImage(named: "Icon_Circle_White.png"))
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        currentIndex = indexPath.row
        tableView.reloadData()
    }
    
    
}
