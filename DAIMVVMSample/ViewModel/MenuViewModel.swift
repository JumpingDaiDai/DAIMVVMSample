import Foundation

class MenuViewModel {
    
    var viewModels = [CellViewModel]() {
        didSet {
            dataChange?()
        }
    }
    
    var dataChange: (()->())?
    
    var apiWebService = ApiWebService()
    
    func loadData() {
        
        viewModels = [InfoCellViewModel]()
        
        let menuData = apiWebService.getData()
        
        // Image Cell View Model
        viewModels.append(ImageCellViewModel(imageModel: menuData.imageModel))
        
        // Info Cell View Model
        for infoModel in menuData.infoListModel.infoList {
            viewModels.append(InfoCellViewModel(infoModel: infoModel))
        }
    }
}
