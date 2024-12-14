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
        .modelContainer(for: ShoeModel.self) { result in
            do {
                let container = try result.get()
                let interactor: DataInteractor = Interactor()
                
                let descriptor = FetchDescriptor<ShoeModel>()
                let existingShoes = try container.mainContext.fetchCount(descriptor)
                guard existingShoes == 0 else { return }
                

                do {
                    let shoes: [ShoeModel] = try interactor.getShoes()
                    for shoe  in shoes {
                        container.mainContext.insert(shoe)
                    }
                } catch {
                    
                    print("Error en la carga del JSON \(error.localizedDescription)")
                    
                }

                // Add all our data to the context.
            } catch {
                print("Failed to pre-seed database.")
            }
        }

        WindowGroup(id: "shoe3D") {
            VolumetricShoe()
                .environment(shoesVM)
                .environment(navigationRouter)
        }
        .windowStyle(.volumetric)
        .defaultSize(width: 0.65, height: 0.65, depth: 0.65, in: .meters)
    }
}

