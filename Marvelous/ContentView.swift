//
//  ContentView.swift
//  Marvelous
//
//  Created by Dylan Perry on 3/16/20.
//  Copyright © 2020 dperry.io. All rights reserved.
//


import SwiftUI
import Combine

struct ContentView: View {
    @ObservedObject private var viewModel = MarvelCharactersViewModel()
    
    
    var body: some View {
        VStack{
            Text("Marveeeelllous!")
            List {
                ForEach(viewModel.characterList, id: \.self) { character in
                    HStack{
                        Text(character.name)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
