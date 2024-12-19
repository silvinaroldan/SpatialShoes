//
//  FavoritesView.swift
//  SpatialShoes
//
//  Created by Silvina Roldan on 16/08/2024.
//

import RealityKit
import SpatialShoesRC
import SwiftData
import SwiftUI

struct FavoritesView: View {
    // @Environment(ShoesVM.self) private var shoesVM
    @Environment(NavigationRouter.self) private var router

    @Query private var favorites: [ShoeDataModel]

    @State var rotationAngle: Double = 0.0

    let columns = [
        GridItem(.adaptive(minimum: 280), spacing: 30)
    ]

    /// The content and layout of the favorites view.
    var body: some View {
        // @Bindable var router = router
        // @Bindable var shoesVM = shoesVM

        // let columns = Array(repeating: GridItem(.flexible(), spacing: 10), count: 5)
        NavigationStack {
            VStack {
                if favorites.isEmpty {
                    Text("No favorites yet")
                        .font(.largeTitle)
                        .padding()
                } else {
                    ScrollView {
                        LazyVGrid(columns: self.columns, spacing: 30) {
                            ForEach(favorites) { shoe in
                                VStack {
                                    RealityView { content in
                                        do {
                                            let entity = try await Entity(
                                                named: shoe.model3DName,
                                                in: spatialShoesRCBundle
                                            )
//                                            entity.scale = SIMD3<Float>(repeating: 0.5)
//                                            entity.position = [0.02, -0.05, -0.08]
                                            content.add(entity)
                                        } catch {
                                            print("Error: \(error)")
                                        }
                                    }
                                    .frame(height: 220)
                                }
                            }
                        }
                    }
                }
            }
        }
        .navigationTitle("Favorites")
    }
}
