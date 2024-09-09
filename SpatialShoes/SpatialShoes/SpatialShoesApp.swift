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
    @State var navigationRouter = NavigationRouter()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(shoesVM)
                .environment(navigationRouter)
        }

        WindowGroup(id: "shoe3D") {
            VolumetricShoe()
                .environment(shoesVM)
                .environment(navigationRouter)
        }
        .windowStyle(.volumetric)
        .defaultSize(width: 1.0, height: 1.0, depth: 1.0, in: .meters)
    }
}
