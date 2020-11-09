//
//  ListCell.swift
//  DAIMVVMSample
//
//  Created by DaiDai on 2020/10/29.
//  Copyright © 2020 Jason_Chung. All rights reserved.
//

import UIKit

class ListCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    var viewModel: ListViewModel?
    
    func cellConfigure(data: CellViewModel) {
        
        selectionStyle = .none
        
        guard let viewModel = data as? ListViewModel else { return }
        self.viewModel = viewModel
    }
    
//    func addTapGesture(to view: UIView) {
//        let tap = UITapGestureRecognizer(target: self, action: #selector(self.tapped))
//        view.addGestureRecognizer(tap)
//    }
//
//    @objc func tapped() {
//        viewModel?.delegate?.showAlert(title: "點到圖片")
//    }
}
