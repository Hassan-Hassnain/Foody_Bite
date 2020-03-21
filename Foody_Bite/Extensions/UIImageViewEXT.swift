//
//  UIImageViewEXT.swift
//  Foody_Bite
//
//  Created by Usama Sadiq on 3/21/20.
//  Copyright © 2020 Usama Sadiq. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    func load(fromURL: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: fromURL) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
    
    
    func load(from url: String) {
        guard let imageURL = URL(string: url) else { return }
        
        // just not to cause a deadlock in UI!
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: imageURL) else { return }
            
            let image = UIImage(data: imageData)
            DispatchQueue.main.async {
                self.image = image
            }
        }
    }
    
    
    
}


