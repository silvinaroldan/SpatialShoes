//
//  ContentView.swift
//  SpatialShoes
//
//  Created by Silvina Roldan on 07/08/2024.
//

import RealityKit
import SwiftUI

struct ContentView: View {
    @Environment(ShoesViewModel.self) private var shoesVM

    var body: some View {
        @Bindable var shoeBindable = shoesVM

        NavigationSplitView {
            List(selection: $shoeBindable.selectedShoe) {
                ForEach(shoesVM.shoes) { shoe in
                    Text(shoe.name)
                        .tag(shoe)
                }
            }
            .navigationTitle("Shoes")
            .navigationSplitViewColumnWidth(230)
        } content: {
            if let selectedShoe = shoesVM.selectedShoe {
                ShoeContent(selectedShoe: selectedShoe)
            }
        } detail: {
            if let selectedShoe = shoesVM.selectedShoe {
                ShoeDetail(selectedShoe: selectedShoe)
            } else {
                Text("Select a shoe from the list")
            }
        }
        .alert("App Error", isPresented:
            $shoeBindable.showAlert) {}
        message: {
            Text(shoesVM.errorMsg)
        }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
