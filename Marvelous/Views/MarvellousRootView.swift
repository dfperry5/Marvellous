//
//  MarvellousRootView.swift
//  Marvelous
//
//  Created by Dylan Perry on 3/16/20.
//  Copyright © 2020 dperry.io. All rights reserved.
//

import SwiftUI

struct MarvellousRootView: View {
    var body: some View {
        VStack{
            Text("MARVELous")
            CharacterListView()
        }
    }
}

struct MarvellousRootView_Previews: PreviewProvider {
    static var previews: some View {
        MarvellousRootView()
    }
}
