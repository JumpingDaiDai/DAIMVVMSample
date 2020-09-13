//
//  ImageCell.swift
//  DAIMVVMSample
//
//  Created by Jason_Chung on 2020/9/13.
//  Copyright © 2020 Jason_Chung. All rights reserved.
//

import UIKit

class ImageCell : UITableViewCell, CellConfigurable {
    
    @IBOutlet weak var headImageView: UIImageView!
    
    func cellConfigure(data: CellViewModel) {
        
        selectionStyle = .none
        
        guard let viewModel = data as? ImageCellViewModel else { return }
        guard let imageUrl = viewModel.imageUrl else { return }
        headImageView.loadImge(withUrl: imageUrl)
    }
}
