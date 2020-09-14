import UIKit

class MenuViewModel {
    
    var viewModels = [CellViewModel]() {
        didSet {
            dataChange?()
        }
    }
    
    var dataChange: (() -> Void)?
    
    var cellPressed: ((CellViewModel) -> Void)?
    
    var apiWebService = ApiWebService()
    
    weak var navDelegate: Navigatable?
    
    func loadData() {
        
        var viewModels = [CellViewModel]()
        
        // call api
        let menuData = apiWebService.getData()
        
        // Image Cell View Model
        viewModels.append(ImageCellViewModel(imageModel: menuData.imageModel))
        
        // Info Cell View Model
        for infoModel in menuData.infoListModel.infoList {
            
            let infoViewModel = InfoCellViewModel(infoModel: infoModel)
            infoViewModel.cellPressed = { [weak self] in
                
                self?.cellPressed?(infoViewModel)
            }
            viewModels.append(infoViewModel)
        }
        
        // Detail Button View Model
        viewModels.append(DetailButtonCellViewModel())
        
        self.viewModels = viewModels
    }
    
    func goToDetailView() {
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        if let vc = sb.instantiateViewController(identifier: "DetailView") as? DetailView {
            navDelegate?.push(to: vc, animated: true)
        }
    }
}
