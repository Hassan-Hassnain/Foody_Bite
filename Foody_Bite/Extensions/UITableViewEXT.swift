//
//  UITableViewEXT.swift
//  Foody_Bite
//
//  Created by Usama Sadiq on 3/21/20.
//  Copyright © 2020 Usama Sadiq. All rights reserved.
//

import UIKit

extension UITableView {
    func regCell(cellName: String){
        self.register(UINib(nibName: cellName, bundle: nil), forCellReuseIdentifier: cellName)
    }
}
