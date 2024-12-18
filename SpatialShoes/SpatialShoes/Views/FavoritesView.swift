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
    @Environment(ShoesVM.self) private var shoesVM
    @Environment(NavigationRouter.self) private var router

    @Query(filter: #Predicate<ShoeDataModel> { shoe in
        shoe.isFavorite == true
    }) var favoritesShoes: [ShoeDataModel]
    
    @State var rotationAngle: Double = 0.0

    var body: some View {
        @Bindable var router = router
        @Bindable var shoesVM = shoesVM

        let columns = Array(repeating: GridItem(.flexible(), spacing: 10), count: 5)

        VStack {
            Text("Favoritos")
                .font(.title)
                .padding()
            if favoritesShoes.isEmpty {
                VStack(alignment: .center) {
                    Text("No hay favoritos seleccionados")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
            ScrollView {
                LazyVGrid(columns: columns, spacing: 10) {
           
                    ForEach(favoritesShoes, id: \.self) { item in

                        VStack(alignment: .center) {
                            Model3D(named: item.model3DName, bundle: spatialShoesRCBundle) { phase in
                                if let model = phase.model {
                                    model
                                    .resizable()
                                    .scaledToFit()
                                    .scaleEffect(1.0)
                                   // .rotation3DEffect(.degrees(rotationAngle), axis: (x: 0, y: 1, z: 0))
                                } else if phase.error != nil {
                                    //print("Error en la carga")
                                } else {
                                    ProgressView()
                                }
                            }
                            .frame(width: 120, height: 120, alignment: .center)

                            Button {
                                router.selectedTab = Tab.home
                                //shoesVM.selectedShoe = item
                            } label: {
                                Text(item.name)
                            }
                        }
                    }
                }
            }
        }
        .padding(.top)
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

