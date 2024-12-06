//
//  SpatialShoesApp.swift
//  SpatialShoes
//
//  Created by Silvina Roldan on 07/08/2024.
//

import SwiftUI
import SwiftData

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
        .modelContainer(for: [ShoeModel.self])

        WindowGroup(id: "shoe3D") {
            VolumetricShoe()
                .environment(shoesVM)
                .environment(navigationRouter)
        }
        .windowStyle(.volumetric)
        .defaultSize(width: 0.65, height: 0.65, depth: 0.65, in: .meters)
    }
}
