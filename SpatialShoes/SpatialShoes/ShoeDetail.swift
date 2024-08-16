//
//  ShoeDetail.swift
//  SpatialShoes
//
//  Created by Silvina Roldan on 08/08/2024.
//

import RealityKit
import SwiftUI
import SpatialShoesRC

struct ShoeDetail: View {
    let selectedShoe: ShoeModel

    var body: some View {
        VStack {
//            RealityView { content in
//                async let shoeEntity = Entity(named: selectedShoe.model3DName)
//                if let shoe = try? await shoeEntity {
//                    shoe.scale *= 0.2
//                    shoe.position.y -= 0.02
//                    content.add(shoe)
//
//                }
//            } 
            Model3D(named: selectedShoe.model3DName, bundle: spatialShoesRCBundle) { model in
                model
                    .resizable()
                    .scaledToFit()
                    .scaleEffect(0.3)
                    .background(Color.green)
            } placeholder: {
                ProgressView()
            }
        }
    }
}

#Preview(windowStyle: .automatic) {
    ShoeDetail(selectedShoe: .test)
}
