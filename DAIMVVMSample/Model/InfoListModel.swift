import Foundation

struct InfoListModel {
    
    var infoList = [InfoModel]()
    
    init(dict: Dictionary<AnyHashable, Any>) {
        
        infoList = [InfoModel]()
        
        guard let infoList = dict["info"] as? Array<Any> else { return }
        
        for dict in infoList {
            self.infoList.append(InfoModel(dict: dict as! Dictionary<AnyHashable, Any>))
        }
    }
}

struct InfoModel {
    
    var index: Int?
    var title: String?
    var detail: String?
    
    init(dict: Dictionary<AnyHashable, Any>) {
        
        index = dict["index"] as? Int
        title = dict["title"] as? String
        detail = dict["detail"] as? String
    }
}
