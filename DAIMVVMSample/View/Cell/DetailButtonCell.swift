//
//  DetailButtonCell.swift
//  DAIMVVMSample
//
//  Created by Jason_Chung on 2020/9/13.
//  Copyright © 2020 Jason_Chung. All rights reserved.
//

import UIKit

class DetailButtonCell : UITableViewCell, CellConfigurable {
    
    var viewModel: DetailButtonCellViewModel?
    
    var buttonAction: (() -> Void)?
    
    func cellConfigure(data: CellViewModel) {
        
        guard let viewModel = data as? DetailButtonCellViewModel else { return }
        self.viewModel = viewModel
    }
    
    @IBAction func buttonIsPressed(_ sender: Any) {
        buttonAction?()
    }
}
