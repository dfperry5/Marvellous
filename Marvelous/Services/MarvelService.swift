//
//  MarvelService.swift
//  Marvelous
//
//  Created by Dylan Perry on 3/16/20.
//  Copyright © 2020 dperry.io. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

final class MarvelService {
    static let shared = MarvelService()
    private let sharedUrlSession = URLSession.shared
    private init() { }
    
    func getAllCharacters(for url: URL) -> AnyPublisher<CharacterResponse, Never> {
        
        return sharedUrlSession.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: CharacterResponse.self, decoder: JSONDecoder())
            .replaceError(with: CharacterResponse(data: CharacterData(results: [])))
            .eraseToAnyPublisher()
    }
}
