//
//  Shoe.swift
//  SpatialShoes
//
//  Created by Silvina Roldan on 16/08/2024.
//

import SwiftUI
import RealityKit
import SpatialShoesRC

struct VolumetricShoe: View {
    @Environment(ShoesVM.self) private var shoesVM

    var body: some View {
        RealityView { content in

            guard let selectedShoe = shoesVM.selectedShoe else { return }
            do {
                let shoe = try await Entity(named: selectedShoe.model3DName, in: spatialShoesRCBundle)
                shoe.scale = SIMD3(x: 10, y:10, z: 10)
                content.add(shoe)
            } catch {
                print("Error en la carga \(error)")
            }
        }
    }
}
