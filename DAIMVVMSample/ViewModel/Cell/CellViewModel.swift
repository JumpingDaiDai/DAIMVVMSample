//
//  CellViewModel.swift
//  DAIMVVMSample
//
//  Created by Jason_Chung on 2020/9/13.
//  Copyright © 2020 Jason_Chung. All rights reserved.
//

import Foundation

protocol CellViewModel {}

protocol CellViewModelPressible {
    var cellPressed:(() -> Void)? { get set }
}

class InfoCellViewModel: CellViewModel, CellViewModelPressible {
    
    var infoModel: InfoModel? {
        didSet {
            dataChange?()
        }
    }
    
    var dataChange: (() -> Void)?
    
    var cellPressed: (() -> Void)?
    
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

class DetailButtonCellViewModel: CellViewModel {
    
}
