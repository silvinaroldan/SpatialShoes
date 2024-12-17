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
        .modelContainer(for: ShoeDataModel.self) { result in
            guard case .success(let container) = result else { return }

            Task { await loadData(container) }
        }
        WindowGroup(id: "shoe3D") {
            VolumetricShoe()
                .environment(shoesVM)
                .environment(navigationRouter)
        }
        .windowStyle(.volumetric)
        .defaultSize(width: 0.65, height: 0.65, depth: 0.65, in: .meters)
    }

    func loadData(_ container: ModelContainer) async {
        do {
            let manager = BackgroundDataManager(modelContainer: container)
            let dataConnection = Network()
            let shoes = try await dataConnection.getShoes()
            try await manager.processShoeData(shoes)
        } catch {
            print("Error loading shoes \(error).")
        }
    }
}
