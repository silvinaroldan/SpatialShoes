//
//  HomeView.swift
//  SpatialShoes
//
//  Created by Silvina Roldan on 07/08/2024.
//

import RealityKit
import SwiftUI
import SwiftData

struct HomeView: View {
    @Environment(ShoesVM.self) private var shoesVM
    @Environment(\.openWindow) private var open
    
    @Query(sort: [SortDescriptor<ShoeDataModel>(\.id)]) private var shoes: [ShoeDataModel]

    @State private var rotate = false
    @State private var touch = true

    var body: some View {
        @Bindable var shoeBindable = shoesVM

        NavigationSplitView {
            List(selection: $shoeBindable.selectedShoe) {
                ForEach(shoes) { shoe in
                    Text(shoe.name)
                        .tag(shoe)
                }
            }
            .onChange(of: shoeBindable.selectedShoe) { _, _ in
                rotate = false
            }
//            .onDelete { indexes in
//                shoesVM.deleteShoe(indexes: indexes,
//                                  shoes: shoes,
//                                  context: context)
//            }
            .navigationTitle("Spatial Shoes")
            .navigationSplitViewColumnWidth(230)
        } content: {
            if let selectedShoe = shoesVM.selectedShoe {
                ShoeContent(selectedShoe: selectedShoe)
            }
        } detail: {
            if let selectedShoe = shoesVM.selectedShoe {
                ShoeDetail(selectedShoe: selectedShoe, touch: $touch, rotate: $rotate)
            } else {
                Text("Selecciona un zapato de la lista")
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
                            Text("Ver en Detalle")
                        }
                    }
                    .toggleStyle(.button)
                }
            }
        }

    }
}

#Preview(windowStyle: .automatic) {
    HomeView()
}
