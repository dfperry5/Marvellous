//
//  CharacterDetailView.swift
//  Marvelous
//
//  Created by Dylan Perry on 3/16/20.
//  Copyright © 2020 dperry.io. All rights reserved.
//

import SwiftUI

struct CharacterDetailView: View {
    let character: Character

    var body: some View {
        VStack {
            Text(character.name)
            Text(character.description)
                .fixedSize(horizontal: false, vertical: true)
            Text("Appears in \(character.comics.available) different comic books!")
        }
    }
}

struct CharacterDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetailView(character: Character(id: 1, name: "Dylan Perry", description: "The Real Iron Man", comics: CharacterComicInfo(available: 3)))
    }
}
