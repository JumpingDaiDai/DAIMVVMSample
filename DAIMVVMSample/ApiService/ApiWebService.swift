import Foundation

class ApiWebService {
    
    func getData() -> (imageModel: ImageModel, infoListModel: InfoListModel) {
        
        // test data
        let data: [String : Any] = [
            "imageUrl" : "https://www.monstersandcritics.com/wp-content/uploads/2020/07/Re-Zero-Rem-wake-up-death.jpg",
            "info" : [
                ["title" : "本名", "detail" : "レム"],
                ["title" : "身高", "detail" : "154cm"],
                ["title" : "個人狀態", "detail" : "沉睡中"]
            ]
        ]
        
        let imageModel = ImageModel(dict: data)
        let infoListModel = InfoListModel(dict: data)
        
        return (imageModel, infoListModel)
    }
}
