//
//  Favorites.swift
//  SpatialShoes
//
//  Created by Silvina Roldan on 16/08/2024.
//

import RealityKit
import SpatialShoesRC
import SwiftData
import SwiftUI

struct Favorites: View {
    @Environment(ShoesViewModel.self) private var shoesVM
    @Environment(NavigationRouter.self) private var router
    
    @Query var favoritesShoes: [ShoeModelMetadata]
    
    @State var rotationAngle: Double = 0.0

    var body: some View {
        @Bindable var router = router
        @Bindable var shoesVM = shoesVM

        let columns = Array(repeating: GridItem(.flexible(), spacing: 10), count: 5)
        
        VStack {
            Text("Favoritos")
                .font(.title)
                .padding()
            ScrollView {
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(getFavoriteShoes(), id: \.self) { item in
                        
                        VStack(alignment: .center) {
                            Model3D(named: item.model3DName, bundle: spatialShoesRCBundle) { model in
                                model
                                    .resizable()
                                    .scaledToFit()
                                    .scaleEffect(1.0)
                                    // .background(Color.green)
                                    .rotation3DEffect(.degrees(rotationAngle), axis: (x: 0, y: 1, z: 0))
                                
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 120, height: 120, alignment: .center)
                            
                            Button {
                                router.selectedTab = Tab.home
                                shoesVM.selectedShoe = item
                            } label: {
                                Text(item.name)
                            }
                        }
                        .padding()
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
    
    func getFavoriteShoes() -> [ShoeModel] {
        let favotitesIds = favoritesShoes
            .filter { $0.isFavorite }
            .map { $0.id }
        return shoesVM.shoes.filter {
            favotitesIds.contains($0.id)
        }
    }
}

#Preview {
    Favorites()
}
