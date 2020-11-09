//
//  ListViewModel.swift
//  DAIMVVMSample
//
//  Created by DaiDai on 2020/10/28.
//  Copyright © 2020 Jason_Chung. All rights reserved.
//

import UIKit

class ListViewModel {
    
    var characterList = [CharacterModel]() {
        didSet {
            valueChange?()
        }
    }
    
    var valueChange: (()->Void)?
    
    func dataFetch() {
        
        ApiWebService.getCharacterList { [weak self] (characterList) in
            guard let self = self else { return }
            
            self.characterList = characterList
        }
    }
}

extension ListViewModel: CellViewModel {
    
    var cellIdentifier: String {
        "\(ListCell.self)"
    }
}
