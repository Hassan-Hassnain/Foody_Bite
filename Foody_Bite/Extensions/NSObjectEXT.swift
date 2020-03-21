//
//  NSObjectEXT.swift
//  Foody_Bite
//
//  Created by Usama Sadiq on 3/21/20.
//  Copyright © 2020 Usama Sadiq. All rights reserved.
//

import Foundation

extension NSObject {
    class var className: String {
        return String(describing: self)
    }
}
