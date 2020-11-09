import Foundation

class ApiWebService {
    
    class func getDetailById(id: String, handler: ((ImageModel?, InfoListModel?) -> ())?) {
        
        if let characterList = readPlist(fileName: "CharacterDetailList") {
            
            var imageModel: ImageModel?
            var infoListModel: InfoListModel?
            for character in characterList {
                
                if id == character["id"] {
                    
                    imageModel = ImageModel(dict: character)
                    infoListModel = InfoListModel(dict: character)
                }
            }
            
            handler?(imageModel, infoListModel)
        }
        else {
            handler?(nil, nil)
        }
    }
    
    class func getCharacterList(handler: (([CharacterModel]) -> ())?) {
        
        var characters = [CharacterModel]()
        
        if let characterList = readPlist(fileName: "CharacterList") {
            
            characters = CharacterListModel(array: characterList).characterList
        }

        handler?(characters)
    }
    
    class func readPlist(fileName: String) -> [[String: String]]? {
        
        guard let path = Bundle.main.path(forResource: fileName, ofType: "plist") else { return nil }
        let url = URL(fileURLWithPath: path)
        let data = try! Data(contentsOf: url)
        guard let plist = try! PropertyListSerialization.propertyList(from: data, options: .mutableContainers, format: nil) as? [[String: String]] else { return nil }
        print(plist)
        
        return plist
    }
}
