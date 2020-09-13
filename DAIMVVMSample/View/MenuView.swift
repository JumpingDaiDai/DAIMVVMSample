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
    
    lazy var detailButtonCell: DetailButtonCell = {
        Bundle.main.loadNibNamed("\(DetailButtonCell.self)", owner: self, options: nil)?.first as? DetailButtonCell ?? DetailButtonCell()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // regist cell
        setupTableView()
        
        // binding
        viewModel.dataChange = { [weak self] in
            self?.tableView.reloadData()
        }
        
        viewModel.cellPressed = { [weak self] (viewModel: CellViewModel) in
            DispatchQueue.main.async {
                if let infoViewModel = viewModel as? InfoCellViewModel {
                    self?.showAlert(title: infoViewModel.text)
                }
            }
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
    
    func showAlert(title: String) {
        
        let alertController = UIAlertController(title: title, message: "要如何處理點擊後跳轉？", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "確認", style: .default, handler: nil)
        alertController.addAction(okAction)
        
        present(alertController, animated: true, completion: nil)
    }
}

extension MenuView : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellViewModel = viewModel.viewModels[indexPath.row]
        
        // var cell
        if cellViewModel is DetailButtonCellViewModel {
            
            detailButtonCell.cellConfigure(data: cellViewModel)
            detailButtonCell.buttonAction = { [weak self] in
                self?.goToDetailView()
            }
            return detailButtonCell
        }
        
        // reusable cell
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier(viewModel: cellViewModel), for: indexPath)
        
        if let cell = cell as? CellConfigurable {
            cell.cellConfigure(data: cellViewModel)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cellViewModel = viewModel.viewModels[indexPath.row]
        if let viewModel = cellViewModel as? CellViewModelPressible {
            // TODO: 這裡到底要通知 View Model，還是可以直接呼叫 View 的 shwoAlert()
            viewModel.cellPressed?()
//            if let infoViewModel = viewModel as? InfoCellViewModel {
//                showAlert(title: infoViewModel.text)
//            }
        }
    }
}


// MARK: - Navigator
extension MenuView {
    
    func goToDetailView() {
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        if let vc = sb.instantiateViewController(identifier: "DetailView") as? DetailView {
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
