//
//  DetailCellViewModel.swift
//  DAIMVVMSample
//
//  Created by Jason_Chung on 2020/9/13.
//  Copyright © 2020 Jason_Chung. All rights reserved.
//

import Foundation

class InfoCellViewModel: CellViewModel {
    
    var infoModel: InfoModel?
    
    var delegate: DetailViewDelegate?
    
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
    
    init(infoModel: InfoModel, delegate: DetailViewDelegate?) {
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
    
    var delegate: DetailViewDelegate?
    
    init(imageModel: ImageModel, delegate: DetailViewDelegate?) {
        self.imageModel = imageModel
        self.delegate = delegate
    }
}

class OtherInfoButtonCellViewModel: CellViewModel {
    
    var cellIdentifier: String {
        "\(OtherInfoButtonCell.self)"
    }
    
    var delegate: DetailViewDelegate?
    var cellViewModels: [CellViewModel]?
    
    init(delegate: DetailViewDelegate?) {
        self.delegate = delegate
    }
}
