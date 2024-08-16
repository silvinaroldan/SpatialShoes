//
//  ShoeGrid.swift
//  SpatialShoes
//
//  Created by Silvina Roldan on 16/08/2024.
//

import RealityKit
import SpatialShoesRC
import SwiftUI

struct ShoeGrid: View {
    
    // TODO: change this variable to environment
    // TODO: check why some shoes are repeated
    // TODO: I think that only one model should rotate and not all at once, maybe we should delete this view
    
    
    @State var shoesVM = ShoesViewModel()
    @State var rotationAngle: Double = 0.0

    // https://www.youtube.com/watch?v=LnPMsG0sV50
    var body: some View {
        Grid {
            ForEach(0..<4) { rowIndex in
                GridRow {
                    ForEach(0..<6) { columnIndex in
                        let index = (rowIndex * 4) + columnIndex
                        Model3D(named: shoesVM.shoes[index].model3DName, bundle: spatialShoesRCBundle) { model in
                            model
                                .resizable()
                                .scaledToFit()
                                .scaleEffect(0.5)
                                //.background(Color.green)
                                .rotation3DEffect(.degrees(rotationAngle), axis: (x: 0, y: 1, z: 0))
                        } placeholder: {
                            ProgressView()
                        }
                    }
                }
            }
        }
        .onAppear() {
            doRotation()
        }
    }
    
    func doRotation() {
        Timer.scheduledTimer(withTimeInterval: 0.03, repeats: true) { timer in
            rotationAngle += 0.3
            if rotationAngle >= 360 {
                rotationAngle = 0
            }
        }
    }
}

#Preview {
    ShoeGrid()
}
