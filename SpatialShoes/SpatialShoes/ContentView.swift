//
//  ContentView.swift
//  SpatialShoes
//
//  Created by Silvina Roldan on 07/08/2024.
//

import SwiftUI
import RealityKit

struct ContentView: View {
    
    @State var shoesViewModel = ShoesViewModel()
    
    var body: some View {
        List {
            ForEach(shoesViewModel.shoes) { shoe in
                Text(shoe.name)
            }
        }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
