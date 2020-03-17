//
//  CharacterResponse.swift
//  Marvelous
//
//  Created by Dylan Perry on 3/16/20.
//  Copyright © 2020 dperry.io. All rights reserved.
//

import Foundation

struct CharacterResponse: Codable {
    var data: CharacterData
}

struct CharacterData: Codable {
    var results: [Character]
}
