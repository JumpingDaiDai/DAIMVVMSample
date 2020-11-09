//
//  CharacterList.swift
//  DAIMVVMSample
//
//  Created by DaiDai on 2020/10/29.
//  Copyright © 2020 Jason_Chung. All rights reserved.
//

import Foundation

struct CharacterListModel {
    
    var characterList = [CharacterModel]()
    
    init(array: Array<Dictionary<AnyHashable, Any>>) {
        
        characterList = [CharacterModel]()
        
        for dict in array {
            self.characterList.append(CharacterModel(dict: dict))
        }
    }
}

struct CharacterModel {
    
    var id: String?
    var name: String?
    
    init(dict: Dictionary<AnyHashable, Any>) {
        
        id = dict["id"] as? String
        name = dict["name"] as? String
    }
}
