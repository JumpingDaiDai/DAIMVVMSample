//
//  InfoCell.swift
//  DAIMVVMSample
//
//  Created by Jason_Chung on 2020/9/13.
//  Copyright © 2020 Jason_Chung. All rights reserved.
//

import UIKit

class InfoCell : UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    var viewModel: InfoCellViewModel? {
        didSet {
            selectionStyle = .none
            
            titleLabel.text = viewModel?.index
            detailLabel.text = viewModel?.detail
            self.addTapGstureRecognice(to: self)
        }
    }
    
    func addTapGstureRecognice(to view: UIView) {
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.tapped))
        view.addGestureRecognizer(tap)
    }
    
    @objc func tapped() {
        viewModel?.delegate?.showAlert(title: titleLabel.text ?? "本名")
    }
}


