//
//  MenuView.swift
//  DAIMVVMSample
//
//  Created by Jason_Chung on 2020/9/13.
//  Copyright © 2020 Jason_Chung. All rights reserved.
//

import UIKit

protocol MainViewDelegate: Navigatable, Alertable { }

class MenuView : UIViewController, MainViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    lazy var viewModel = MenuViewModel(with: self)
    
    lazy var detailButtonCell: DetailButtonCell = {
        Bundle.main.loadNibNamed("\(DetailButtonCell.self)", owner: self, options: nil)?.first as? DetailButtonCell ?? DetailButtonCell()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // regist cell
        setupTableView()

        // load api
        viewModel.loadData()
    }
    
    func setupTableView() {
        
        tableView.register(UINib(nibName: "\(ImageCell.self)", bundle: nil), forCellReuseIdentifier: "\(ImageCell.self)")
        tableView.register(UINib(nibName: "\(InfoCell.self)", bundle: nil), forCellReuseIdentifier: "\(InfoCell.self)")
    }
    

}

extension MenuView : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModel.viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellViewModel = viewModel.viewModels[indexPath.row]
        
        // var cell
        if let cellViewModel = cellViewModel as? DetailButtonCellViewModel {

            detailButtonCell.viewModel = cellViewModel
            return detailButtonCell
        }
        
        // reusable cell
        let cell = tableView.dequeueReusableCell(withIdentifier: cellViewModel.cellIdentifier, for: indexPath)

        if let cell = cell as? InfoCell, let viewModel = cellViewModel as? InfoCellViewModel {
            cell.viewModel = viewModel
        }
        else if let cell = cell as? ImageCell, let viewModel = cellViewModel as? ImageCellViewModel {
            cell.viewModel = viewModel
        }
 
        return cell
    }
    
}


// MARK: - Navigatable
extension MenuView: Navigatable {
    
    func push(to viewController: UIViewController, animated: Bool) {
        navigationController?.pushViewController(viewController, animated: animated)
    }
}

extension MenuView: Alertable {
    
    func showAlert(title: String) {
        
        let alertController = UIAlertController(title: title, message: "要如何處理點擊後跳轉？", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "確認", style: .default, handler: nil)
        alertController.addAction(okAction)
        
        present(alertController, animated: true, completion: nil)
    }
}
