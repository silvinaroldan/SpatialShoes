//
//  ShoeDetail.swift
//  SpatialShoes
//
//  Created by Silvina Roldan on 08/08/2024.
//

import RealityKit
import SwiftUI

struct ShoeDetail: View {
    let selectedShoe: ShoeModel

    var body: some View {
        Model3D(named: selectedShoe.model3DName) { model in
            model.resizable()
                .scaledToFit()
                .frame(width: 300)
        } placeholder: {
            ProgressView()
        }
    }
}

#Preview(windowStyle: .automatic) {
    ShoeDetail(selectedShoe: .test)
}
