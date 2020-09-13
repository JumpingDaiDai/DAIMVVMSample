//
//  MenuView.swift
//  DAIMVVMSample
//
//  Created by Jason_Chung on 2020/9/13.
//  Copyright © 2020 Jason_Chung. All rights reserved.
//

import UIKit

class MenuView : UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel = MenuViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // regist cell
        setupTableView()
        
        // binding
        viewModel.dataChange = { [weak self] in
            self?.tableView.reloadData()
        }
        
        // load api
        viewModel.loadData()
    }
    
    func setupTableView() {
        
        tableView.register(UINib(nibName: "\(ImageCell.self)", bundle: nil), forCellReuseIdentifier: "\(ImageCell.self)")
        tableView.register(UINib(nibName: "\(InfoCell.self)", bundle: nil), forCellReuseIdentifier: "\(InfoCell.self)")
    }
    
    func cellIdentifier(viewModel: CellViewModel) -> String {
        
        if viewModel is ImageCellViewModel {
            
            return "\(ImageCell.self)"
        }
        else if viewModel is InfoCellViewModel {
            
            return "\(InfoCell.self)"
        }
        
        return ""
    }
}

extension MenuView : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellViewModel = viewModel.viewModels[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier(viewModel: cellViewModel), for: indexPath)
        
        if let cell = cell as? CellConfigurable {
            cell.cellConfigure(data: cellViewModel)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
}
