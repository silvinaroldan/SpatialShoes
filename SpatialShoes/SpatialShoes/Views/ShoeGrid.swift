//
//  Favorites.swift
//  SpatialShoes
//
//  Created by Silvina Roldan on 16/08/2024.
//

import RealityKit
import SpatialShoesRC
import SwiftUI

struct Favorites: View {
    // TODO: check why some shoes are repeated
    // TODO: I think that only one model should rotate and not all at once, maybe we should delete this view

    @Environment(ShoesViewModel.self) private var shoesVM
    @Environment(NavigationRouter.self) private var router
    @State var rotationAngle: Double = 0.0

    // https://www.youtube.com/watch?v=LnPMsG0sV50
    var body: some View {
        @Bindable var router = router
        @Bindable var shoesVM = shoesVM

        Grid {
            ForEach(0..<4) { rowIndex in
                GridRow {
                    ForEach(0..<6) { columnIndex in
                        let index = (rowIndex * 4) + columnIndex
                        VStack(alignment: .center) {
                            Model3D(named: shoesVM.shoes[index].model3DName, bundle: spatialShoesRCBundle) { model in
                                model
                                    .resizable()
                                    .scaledToFit()
                                    .scaleEffect(0.5)
                                    // .background(Color.green)
                                    .rotation3DEffect(.degrees(rotationAngle), axis: (x: 0, y: 1, z: 0))

                            } placeholder: {
                                ProgressView()
                            }

                            .frame(width: 130, height: 130)

                            Button {
                                router.selectedTab = Tab.home
                                shoesVM.selectedShoe = shoesVM.shoes[index]
                            } label: {
                                Text(shoesVM.shoes[index].name)
                            }
                        }
                    }
                }
            }
        }
        .onAppear {
            doRotation()
        }
    }

    func doRotation() {
        Timer.scheduledTimer(withTimeInterval: 0.03, repeats: true) { _ in
            rotationAngle += 0.3
            if rotationAngle >= 360 {
                rotationAngle = 0
            }
        }
    }
}

#Preview {
    Favorites()
}
