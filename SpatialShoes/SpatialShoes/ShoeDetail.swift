//
//  ShoeDetail.swift
//  SpatialShoes
//
//  Created by Silvina Roldan on 08/08/2024.
//

import RealityKit
import SpatialShoesRC
import SwiftUI

struct ShoeDetail: View {
    let selectedShoe: ShoeModel

    var body: some View {
        VStack {
            Model3D(named: selectedShoe.model3DName, bundle: spatialShoesRCBundle) { model in
                model
//                    .resizable()
//                    .scaledToFit()
//                    .scaleEffect(0.3)
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
