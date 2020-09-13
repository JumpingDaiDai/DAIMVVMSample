//
//  ImageModel.swift
//  DAIMVVMSample
//
//  Created by Jason_Chung on 2020/9/13.
//  Copyright © 2020 Jason_Chung. All rights reserved.
//

import Foundation

struct ImageModel {
    
    var imageUrl: String?
    
    init(dict: Dictionary<AnyHashable, Any>) {
        
        imageUrl = dict["imageUrl"] as? String
    }
}
