//
//  ListViewController.swift
//  DAIMVVMSample
//
//  Created by DaiDai on 2020/10/28.
//  Copyright © 2020 Jason_Chung. All rights reserved.
//

import UIKit

protocol ListViewDelegate: Navigatable { }

class ListViewController: UIViewController, ListViewDelegate {
    
    var viewModel = ListViewModel()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        
        viewModel.valueChange = { [weak self] in
            self?.tableView.reloadData()
        }
        
        viewModel.dataFetch()
    }
}

extension ListViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModel.characterList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellViewModel = viewModel.characterList[indexPath.row]
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath) as? ListCell {
            
        }
        
        return UITableViewCell()
//        let cellViewModel = viewModel.cellViewModels[indexPath.row]
//
//        // var cell
//        if let cellViewModel = cellViewModel as? OtherInfoButtonCellViewModel {
//
//            otherInfoButtonCell.viewModel = cellViewModel
//            return otherInfoButtonCell
//        }
//
//        // reusable cell
//        let cell = tableView.dequeueReusableCell(withIdentifier: cellViewModel.cellIdentifier, for: indexPath)
//
//        if let cell = cell as? InfoCell, let viewModel = cellViewModel as? InfoCellViewModel {
//            cell.viewModel = viewModel
//        }
//        else if let cell = cell as? ImageCell, let viewModel = cellViewModel as? ImageCellViewModel {
//            cell.viewModel = viewModel
//        }
//
//        return cell
    }
}

// MARK: - Navigatable
extension ListViewController: Navigatable {
    
    func push(to viewController: UIViewController, animated: Bool) {
        navigationController?.pushViewController(viewController, animated: animated)
    }
}
