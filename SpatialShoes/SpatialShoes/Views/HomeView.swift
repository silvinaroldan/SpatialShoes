//
//  HomeView.swift
//  SpatialShoes
//
//  Created by Silvina Roldan on 07/08/2024.
//

import RealityKit
import SwiftData
import SwiftUI

struct HomeView: View {
    @Environment(ShoesVM.self) private var shoesVM
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
            .onChange(of: shoeBindable.selectedShoe) { _, _ in
                rotate = false
            }

            .navigationTitle("Spatial Shoes")
            .navigationSplitViewColumnWidth(230)
        } content: {
            if let selectedShoe = shoesVM.selectedShoe {
                ShoeContentView(selectedShoe: selectedShoe)
            }
        } detail: {
            if let selectedShoe = shoesVM.selectedShoe {
                ShoeDetailView(selectedShoe: selectedShoe, touch: $touch, rotate: $rotate)
            } else {
                Text("Select a shoe from the list")
            }
        }
        .toolbar {
            if shoesVM.selectedShoe != nil {
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
                            Text("View detail")
                        }
                    }
                    .toggleStyle(.button)
                }
            }
        }
    }
}
