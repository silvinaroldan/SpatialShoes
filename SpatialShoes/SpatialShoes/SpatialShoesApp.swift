//
//  SpatialShoesApp.swift
//  SpatialShoes
//
//  Created by Silvina Roldan on 07/08/2024.
//

import SwiftData
import SwiftUI

@main
struct SpatialShoesApp: App {
    @State var shoesVM = ShoesVM()
    @State var navigationRouter = NavigationRouter()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(shoesVM)
                .environment(navigationRouter)
        }
        .modelContainer(for: ShoeDataModel.self)
        
        WindowGroup(id: "shoe3D") {
            VolumetricShoe()
                .environment(shoesVM)
                .environment(navigationRouter)
        }
        .windowStyle(.volumetric)
        .defaultSize(width: 0.65, height: 0.65, depth: 0.65, in: .meters)
    }
}
