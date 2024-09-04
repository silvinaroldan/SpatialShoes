//
//  SpatialShoesApp.swift
//  SpatialShoes
//
//  Created by Silvina Roldan on 07/08/2024.
//

import SwiftUI

@main
struct SpatialShoesApp: App {
    @State var shoesVM = ShoesViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(shoesVM)
        }

        WindowGroup(id: "shoe3D") {
            VolumetricShoe()
                .environment(shoesVM)
        }
        .windowStyle(.volumetric)
        .defaultSize(width: 1.0, height: 1.0, depth: 1.0, in: .meters)
    }
}
