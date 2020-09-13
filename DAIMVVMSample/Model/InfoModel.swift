import Foundation

struct InfoModel {
    
    var title: String?
    var detail: String?
    
    init(dict: Dictionary<AnyHashable, Any>) {
        
        title = dict["title"] as? String
        detail = dict["detail"] as? String
    }
}
