//
//  InfoCell.swift
//  DAIMVVMSample
//
//  Created by Jason_Chung on 2020/9/13.
//  Copyright © 2020 Jason_Chung. All rights reserved.
//

import UIKit

class InfoCell : UITableViewCell, CellConfigurable {
    
//    var viewModel: InfoCellViewModel?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    func cellConfigure(data: CellViewModel) {
        
        selectionStyle = .none
        
        guard let viewModel = data as? InfoCellViewModel else { return }
//        self.viewModel = viewModel
        
//        self.viewModel?.dataChange = { [weak self] in
//
//            self?.titleLabel.text = self?.viewModel?.text
//            self?.detailLabel.text = self?.viewModel?.detail
//        }
        
        titleLabel.text = viewModel.text
        detailLabel.text = viewModel.detail
    }
}
