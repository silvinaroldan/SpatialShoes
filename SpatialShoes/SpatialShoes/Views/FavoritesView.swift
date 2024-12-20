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
    @Environment(NavigationRouter.self) private var router
    @Environment(ShoesVM.self) private var shoesVM
    @Environment(\.modelContext) var context

    @State private var favorites: [ShoeDataModel] = []

    @State var rotationAngle: Double = 0.0
    @State var isViewVisible: Bool = false

    let columns = [
        GridItem(.adaptive(minimum: 280), spacing: 30)
    ]

    var body: some View {
        @Bindable var router = router
        @Bindable var shoesVM = shoesVM

        let columns = Array(repeating: GridItem(.flexible(), spacing: 10), count: 5)

        VStack {
            Text("Favorites")
                .font(.title)
                .padding()
            if favorites.isEmpty {
                VStack(alignment: .center) {
                    Text("No favorites selected")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
            ScrollView {
                LazyVGrid(columns: columns, spacing: 10) {
           
                    ForEach(favorites, id: \.self) { item in

                        VStack(alignment: .center) {
                            Model3D(named: item.model3DName, bundle: spatialShoesRCBundle) { phase in
                                if let model = phase.model {
                                    model
                                    .resizable()
                                    .scaledToFit()
                                    .scaleEffect(1.0)
                                    .rotation3DEffect(.degrees(rotationAngle), axis: (x: 0, y: 1, z: 0))
                                } else {
                                    ProgressView()
                                }
                            }
                            .frame(width: 120, height: 120, alignment: .center)

                            Button {
                                router.selectedTab = Tab.home
                                shoesVM.selectedShoe = shoesVM.getShoe(id: item.id)
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
            getFavoritesShoes()
            isViewVisible = true
        }
        .onDisappear() {
            isViewVisible = false
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
    
    func getFavoritesShoes() {
        do {
            favorites = try shoesVM.getFavoriteShoes(context: context)
        } catch {
            print("Failed to retrieve favorites")
        }
            
    }
}

