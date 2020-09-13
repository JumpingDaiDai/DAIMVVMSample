import Foundation

class MenuViewModel {
    
    var viewModels = [CellViewModel]() {
        didSet {
            dataChange?()
        }
    }
    
    var dataChange: (() -> Void)?
    
    var cellPressed: ((CellViewModel) -> Void)?
    
    var apiWebService = ApiWebService()
    
    func loadData() {
        
        var viewModels = [CellViewModel]()
        
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
}
