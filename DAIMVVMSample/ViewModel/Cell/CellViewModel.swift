//
//  CellViewModel.swift
//  DAIMVVMSample
//
//  Created by Jason_Chung on 2020/9/13.
//  Copyright © 2020 Jason_Chung. All rights reserved.
//

import Foundation

protocol CellViewModel {}

class InfoCellViewModel: CellViewModel {
    
    var infoModel: InfoModel?
    
    var text: String {
        (infoModel?.title ?? "") + "："
    }
    
    var detail: String {
        (infoModel?.detail ?? "")
    }
    
    init(infoModel: InfoModel) {
        self.infoModel = infoModel
    }
}

class ImageCellViewModel: CellViewModel {
    
    var imageModel: ImageModel
    
    var imageUrl: URL? {
        URL(string: imageModel.imageUrl ?? "")
    }
    
    init(imageModel: ImageModel) {
        self.imageModel = imageModel
    }
}
