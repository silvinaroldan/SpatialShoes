//
//  ContentView.swift
//  SpatialShoes
//
//  Created by Silvina Roldan on 07/08/2024.
//

import RealityKit
import SwiftUI

struct ContentView: View {
    @State var shoesVM = ShoesViewModel()
    @State var selectedShoe: ShoeModel?

    var body: some View {
        NavigationSplitView {
            List(selection: $selectedShoe) {
                ForEach(shoesVM.shoes) { shoe in
                    Text(shoe.name)
                        .tag(shoe)
                }
            }
            .navigationTitle("Shoes")
            .navigationSplitViewColumnWidth(230)
        } content: {
            if let selectedShoe {
               ShoeDetail(selectedShoe: selectedShoe)
            } else {
                Text("Select a shoe from the list")
            }
        } detail: {}
            .alert("App Error", isPresented: $shoesVM.showAlert) {}
            message: {
                Text(shoesVM.errorMsg)
            }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView.preview
}
