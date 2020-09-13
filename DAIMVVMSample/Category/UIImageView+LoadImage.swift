//
//  UIImageView+LoadImage.swift
//  DAIMVVMSample
//
//  Created by Jason_Chung on 2020/9/13.
//  Copyright © 2020 Jason_Chung. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func loadImge(withUrl url: URL) {
        
           DispatchQueue.global().async { [weak self] in
            
               if let imageData = try? Data(contentsOf: url) {
                
                   if let image = UIImage(data: imageData) {
                    
                       DispatchQueue.main.async {
                        
                           self?.image = image
                       }
                   }
               }
           }
       }
}
