//
//  MarvelCharactersViewModel.swift
//  Marvelous
//
//  Created by Dylan Perry on 3/16/20.
//  Copyright © 2020 dperry.io. All rights reserved.
//

import SwiftUI
import Combine
import CommonCrypto


final class MarvelCharactersViewModel: ObservableObject {
    @Published var characterList: [Character] = []
    private var subscriptions = Set<AnyCancellable>()
    private let sharedService = MarvelService.shared
    
    init() {
        sharedService.getAllCharacters(for: getCharactersUrl())
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
        .map{$0.data.results}
        .assign(to: \.characterList, on: self)
        .store(in: &subscriptions)
    }
    
    private func getCharactersUrl() -> URL{
        let ts = NSDate().timeIntervalSince1970.description
        let urlString: String = Constants.MARVEL_HOST + Constants.MARVEL_CHARACTERS_URI + "?ts=\(ts)&limit=100" + "&apikey=" + Constants.MARVEL_PUBLIC_API_KEY + "&hash=\(self.getHash(ts: ts))"
        return URL(string: urlString)!
        
    }
    
    private func getHash(ts: String) -> String {
        return self.MD5(ts + Constants.MARVEL_PRIVATE_API_KEY + Constants.MARVEL_PUBLIC_API_KEY)!
    }
    
    private func MD5(_ string: String) -> String? {
        let length = Int(CC_MD5_DIGEST_LENGTH)
        var digest = [UInt8](repeating: 0, count: length)

        if let d = string.data(using: String.Encoding.utf8) {
            _ = d.withUnsafeBytes { (body: UnsafePointer<UInt8>) in
                CC_MD5(body, CC_LONG(d.count), &digest)
            }
        }

        return (0..<length).reduce("") {
            $0 + String(format: "%02x", digest[$1])
        }
    }
}
