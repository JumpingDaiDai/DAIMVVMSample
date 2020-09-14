import Foundation

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
