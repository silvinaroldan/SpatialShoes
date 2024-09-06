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
    @Environment(\.openWindow) private var open
    
    @State private var rotate = false
    @State private var touch = true

    var body: some View {
        @Bindable var shoeBindable = shoesVM

        NavigationSplitView {
            List(selection: $shoeBindable.selectedShoe) {
                ForEach(shoesVM.shoes) { shoe in
                    Text(shoe.name)
                        .tag(shoe)
                }
            }
            .navigationTitle("Spatial Shoes")
            .navigationSplitViewColumnWidth(230)
            .toolbar {
                ToolbarItem(placement: .bottomOrnament) {
                    HStack(spacing: 30) {
                        Toggle(isOn: $rotate) {
                            Image(systemName: "rotate.3d")
                        }
                        .disabled(touch)
                        Toggle(isOn: $touch) {
                            Image(systemName: "hand.point.up.left")
                        }
                        .disabled(rotate)
                        Button {
                            open(id: "shoe3D")
                        } label: {
                            Text("Ver en Detalle")
                        }
                    }
                    .toggleStyle(.button)
                }
            }
        } content: {
            if let selectedShoe = shoesVM.selectedShoe {
                ShoeContent(selectedShoe: selectedShoe)
            }
        } detail: {
            if let selectedShoe = shoesVM.selectedShoe {
                ShoeDetail(selectedShoe: selectedShoe, touch: $touch, rotate: $rotate)
            } else {
                Text("Select a shoe from the list")
            }
        }
        .onAppear {
            shoesVM.selectedShoe = shoesVM.shoes.first
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
