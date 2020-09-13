//
//  InfoCell.swift
//  DAIMVVMSample
//
//  Created by Jason_Chung on 2020/9/13.
//  Copyright © 2020 Jason_Chung. All rights reserved.
//

import UIKit

class InfoCell : UITableViewCell, CellConfigurable {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    func cellConfigure(data: CellViewModel) {
        
        selectionStyle = .none
        
        guard let viewModel = data as? InfoCellViewModel else { return }
        titleLabel.text = viewModel.text
        detailLabel.text = viewModel.detail
    }
}
