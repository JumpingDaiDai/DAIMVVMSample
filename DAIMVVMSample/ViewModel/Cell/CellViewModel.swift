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

class InfoCellViewModel: CellViewModel {
    
    var infoModel: InfoModel?
    
    var delegate: MainViewDelegate?
    
    var cellIdentifier: String {
        "\(InfoCell.self)"
    }
    
    var index: String {
        "\((infoModel?.index ?? -1)). " + (infoModel?.title ?? "") + "："
    }
    
    var title: String {
        infoModel?.title ?? ""
    }
    
    var text: String {
        (infoModel?.title ?? "") + "："
    }
    
    var detail: String {
        (infoModel?.detail ?? "")
    }
    
    init(infoModel: InfoModel, delegate: MainViewDelegate?) {
        self.infoModel = infoModel
        self.delegate = delegate
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
    
    var delegate: MainViewDelegate?
    
    init(imageModel: ImageModel, delegate: MainViewDelegate?) {
        self.imageModel = imageModel
        self.delegate = delegate
    }
}

class DetailButtonCellViewModel: CellViewModel {
    
    var cellIdentifier: String {
        "\(DetailButtonCell.self)"
    }
    
    var delegate: MainViewDelegate?
    var cellViewModels: [CellViewModel]?
    
    init(delegate: MainViewDelegate?) {
        self.delegate = delegate
    }
    
    
}
