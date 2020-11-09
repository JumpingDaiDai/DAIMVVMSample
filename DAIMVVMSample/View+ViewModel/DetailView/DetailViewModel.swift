//
//  DetailViewModel.swift
//  DAIMVVMSample
//
//  Created by Jason_Chung on 2020/9/13.
//  Copyright © 2020 Jason_Chung. All rights reserved.
//

import UIKit

class DetailViewModel {
    
    var cellViewModels = [CellViewModel]()
    
    var dataChange: (() -> Void)?
    
    var apiWebService = ApiWebService()
    
    weak var delegate: DetailViewDelegate?
    
    init(with delegate: DetailViewDelegate?) {
        self.delegate = delegate
    }
    
    func loadData() {
        
        var viewModels = [CellViewModel]()
        
        // call api
        apiWebService.getDetailById(id: <#T##String#>, handler: { [weak self] (imageModel: ImageModel?, infoListModel: InfoListModel?) in
            
            guard let self = self,
                let imageModel = imageModel,
                let infoListModel = infoListModel else { return }
            
            // Image Cell View Model
            viewModels.append(ImageCellViewModel(imageModel: imageModel, delegate: self.delegate))

            // Info Cell View Model
            for infoModel in infoListModel.infoList {

                let infoViewModel = InfoCellViewModel(infoModel: infoModel, delegate: self.delegate)
                viewModels.append(infoViewModel)
            }

            // Detail Button View Model
            viewModels.append(OtherInfoButtonCellViewModel(delegate: self.delegate))

            self.cellViewModels = viewModels
        })
    }
    
    func goToDetailView() {
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        if let vc = sb.instantiateViewController(identifier: "OtherInfoViewController") as? OtherInfoViewController {
            delegate?.push(to: vc, animated: true)
        }
    }
}
