//
//  CellViewModel.swift
//  DAIMVVMSample
//
//  Created by Jason_Chung on 2020/9/13.
//  Copyright © 2020 Jason_Chung. All rights reserved.
//

import Foundation

protocol CellViewModel {
    var cellIdentifier: String { get }
}

protocol CellViewModelPressible {
    var cellPressed:(() -> Void)? { get set }
}

class InfoCellViewModel: CellViewModel, CellViewModelPressible {
    
    var infoModel: InfoModel? {
        didSet {
//            dataChange?()
        }
    }
    
//    var dataChange: (() -> Void)?
    
    var cellPressed: (() -> Void)?
    
    var cellIdentifier: String {
        "\(InfoCell.self)"
    }
    
    var index: String {
        "\((infoModel?.index ?? -1)). " + (infoModel?.title ?? "") + "："
    }
    
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
    
    var cellIdentifier: String {
        "\(ImageCell.self)"
    }
    
    var imageUrl: URL? {
        URL(string: imageModel.imageUrl ?? "")
    }
    
    init(imageModel: ImageModel) {
        self.imageModel = imageModel
    }
}

class DetailButtonCellViewModel: CellViewModel {
    
    var cellIdentifier: String {
        "\(DetailButtonCell.self)"
    }
}
