//
//  DetailButtonCell.swift
//  DAIMVVMSample
//
//  Created by Jason_Chung on 2020/9/13.
//  Copyright © 2020 Jason_Chung. All rights reserved.
//

import UIKit

class DetailButtonCell : UITableViewCell {
    
    var viewModel: DetailButtonCellViewModel?
    
    @IBAction func buttonIsPressed(_ sender: Any) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        if let vc = sb.instantiateViewController(identifier: "DetailView") as? DetailView {
            viewModel?.delegate?.push(to: vc, animated: true)
        }
        
    }
}
