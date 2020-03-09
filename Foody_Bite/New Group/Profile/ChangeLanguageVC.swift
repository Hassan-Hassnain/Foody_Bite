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
    
    var languages = ["English", ]
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
        
        return cell
    }
    
    
}
