//
//  DataTest.swift
//  SpatialShoes
//
//  Created by Silvina Roldan on 08/08/2024.
//

import SwiftUI

struct DataTest: DataInteractor {
    var url: URL { Bundle.main.url(forResource: "shoesTest", withExtension: "json")! }
}

extension HomeView {
    static var preview: some View {
        HomeView()
            .environment(ShoesViewModel(interactor: DataTest()))
    }
}

extension ShoeModel {
    static let test = ShoeModel(id: 10678, 
                                name: "Elegant Heels",
                                brand: "EleganceWalk", 
                                size: [ 35,
                                        36,
                                        37,
                                        38,
                                        39],
                                price: 119.99,
                                offsetx: 0.0,
                                offsety: 0.0,
                                scale: 0.0,
                                description: "Descubre la sofisticacif3n y el estilo con nuestros **Elegant Heels** de **EleganceWalk**. Disf1ados para las mujeres que buscan destacar en cualquier evento, estos zapatos de tacf3n ofrecen una combinacin perfecta de elegancia y comodidad. Ideales para ocasiones especiales y eventos formales.\n\n**Caracteredsticas Destacadas:**\n- **Material:** Cuero de alta calidad que proporciona un acabado lujoso y duradero",
                                model3DName: "SkateShoes",
                                type: "Tacones",
                                materials: [
                                "Cuero"],
                                origin: "Japf3n",
                                gender: "Femenino",
                                weight: 1.2,
                                colors: [
                                    "Rojo",
                                    "Blanco",
                                    "Negro"],
                                warranty: 2,
                                certifications: [
                                    "Producto Ecolgico",
                                    "ISO 9001"])
}
