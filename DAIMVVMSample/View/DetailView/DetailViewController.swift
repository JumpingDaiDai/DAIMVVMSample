//
//  DetailViewController.swift
//  DAIMVVMSample
//
//  Created by Jason_Chung on 2020/9/13.
//  Copyright © 2020 Jason_Chung. All rights reserved.
//

import UIKit

protocol DetailViewDelegate: Navigatable, Alertable { }

class DetailViewController: UIViewController, DetailViewDelegate {
    
    var activityDatas = [ActivityInfo]
    var kvDatas = [KvDatas]
    
    @IBOutlet weak var tableView: UITableView!
    
    lazy var viewModel = DetailViewModel(with: self)
    
    lazy var otherInfoButtonCell: OtherInfoButtonCell = {
        Bundle.main.loadNibNamed("\(OtherInfoButtonCell.self)", owner: self, options: nil)?.first as? OtherInfoButtonCell ?? OtherInfoButtonCell()
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

extension DetailViewController : UITableViewDelegate, UITableViewDataSource {
    
    // in cell
    func configure(vm: ViewModel) {
        self.viewModel = vm
        // binding VM
        self.viewModel.dataChange = {
            // Data更新
            
            name = self.viewModel.displayName
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModel.cellViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        /*
         new Cell
         new viewModel
         VCViewModel.dataChange = {
            viewModel.data =
         }
         cell.configure(vm: viewModel)
         */
        
        
        let cellViewModel = viewModel.cellViewModels[indexPath.row]
        
        // var cell
        if let cellViewModel = cellViewModel as? OtherInfoButtonCellViewModel {

            otherInfoButtonCell.viewModel = cellViewModel
            return otherInfoButtonCell
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
extension DetailViewController: Navigatable {
    
    func push(to viewController: UIViewController, animated: Bool) {
        navigationController?.pushViewController(viewController, animated: animated)
    }
}

extension DetailViewController: Alertable {
    
    func showAlert(title: String) {
        
        let alertController = UIAlertController(title: title, message: "要如何處理點擊後跳轉？", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "確認", style: .default, handler: nil)
        alertController.addAction(okAction)
        
        present(alertController, animated: true, completion: nil)
    }
}
