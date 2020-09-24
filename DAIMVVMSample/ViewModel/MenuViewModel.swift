import UIKit

class MenuViewModel {
    
    var viewModels = [CellViewModel]() 
    
    var dataChange: (() -> Void)?
    
    var apiWebService = ApiWebService()
    
    weak var delegate: MainViewDelegate?
    
    init(with delegate: MainViewDelegate?) {
        self.delegate = delegate
    }
    
    func loadData() {
        
        var viewModels = [CellViewModel]()
        
        // call api
        let menuData = apiWebService.getData()
        
        // Image Cell View Model
        viewModels.append(ImageCellViewModel(imageModel: menuData.imageModel, delegate: delegate))
        
        // Info Cell View Model
        for infoModel in menuData.infoListModel.infoList {
            
            let infoViewModel = InfoCellViewModel(infoModel: infoModel, delegate: delegate)
            viewModels.append(infoViewModel)
        }
        
        // Detail Button View Model
        viewModels.append(DetailButtonCellViewModel(delegate: delegate))
        
        self.viewModels = viewModels
    }
    
    func goToDetailView() {
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        if let vc = sb.instantiateViewController(identifier: "DetailView") as? DetailView {
            delegate?.push(to: vc, animated: true)
        }
    }
}
