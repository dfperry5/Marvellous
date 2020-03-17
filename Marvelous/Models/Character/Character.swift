//
//  Character.swift
//  Marvelous
//
//  Created by Dylan Perry on 3/16/20.
//  Copyright © 2020 dperry.io. All rights reserved.
//

import Foundation

struct Character: Codable, Hashable {
    static func == (lhs: Character, rhs: Character) -> Bool {
        return lhs.id == rhs.id
    }
    

    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(id)
    }
    
    let id: Int
    let name: String
    let description: String
    let comics: CharacterComicInfo
}
