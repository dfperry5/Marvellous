//
//  CharacterListView.swift
//  Marvelous
//
//  Created by Dylan Perry on 3/16/20.
//  Copyright © 2020 dperry.io. All rights reserved.
//

import SwiftUI

struct CharacterListView: View {
    @ObservedObject private var viewModel = MarvelCharactersViewModel()

    var body: some View {
        NavigationView {
            if (viewModel.characterList.count > 0){
                List {
                    Section(header: Text("First 100 Super Heros") ){
                        ForEach(viewModel.characterList, id: \.self) { character in
                            NavigationLink(destination: CharacterDetailView(character: character)) {
                                Text(character.name)
                            }
                        }
                    }
                }
            } else {
                Text("Loading...")
            }
        }
    }
}

struct CharacterListView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterListView()
    }
}
