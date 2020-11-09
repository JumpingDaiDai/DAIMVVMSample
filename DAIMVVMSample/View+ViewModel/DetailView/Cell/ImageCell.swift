//
//  ImageCell.swift
//  DAIMVVMSample
//
//  Created by Jason_Chung on 2020/9/13.
//  Copyright © 2020 Jason_Chung. All rights reserved.
//

import UIKit

class ImageCell: UITableViewCell {
    
    @IBOutlet weak var headImageView: UIImageView!
    
    var viewModel: ImageCellViewModel? {
        didSet {
            selectionStyle = .none
            
            guard let imageUrl = viewModel?.imageUrl else { return }
            headImageView.loadImge(withUrl: imageUrl)
            addTapGesture(to: self)
        }
    }
    
    func cellConfigure(data: CellViewModel) {
        
        selectionStyle = .none
        
        guard let viewModel = data as? ImageCellViewModel else { return }
        guard let imageUrl = viewModel.imageUrl else { return }
        headImageView.loadImge(withUrl: imageUrl)
        addTapGesture(to: self)
    }
    
    func addTapGesture(to view: UIView) {
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.tapped))
        view.addGestureRecognizer(tap)
    }
    
    @objc func tapped() {
        viewModel?.delegate?.showAlert(title: "點到圖片")
    }
}
