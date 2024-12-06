//
//  ShoeModel.swift
//  SpatialShoes
//
//  Created by Silvina Roldan on 07/08/2024.
//

import SwiftData
import SwiftUI

struct Offset: Codable {
    var id: UUID { UUID() }
    let x: Double
    let y: Double
}

@Model
class ShoeModel: Identifiable, Hashable {
    init(id: UUID, name: String, brand: String, size: [Int], price: Double, desc: String, model3DName: String, type: String, materials: [String], origin: String, gender: String, weight: Double, colors: [String], warranty: Int, certifications: [String], offset: Offset, scale: Double, isFavorite: Bool) {
        self.id = id
        self.name = name
        self.brand = brand
        self.size = size
        self.price = price
        self.desc = desc
        self.model3DName = model3DName
        self.type = type
        self.materials = materials
        self.origin = origin
        self.gender = gender
        self.weight = weight
        self.colors = colors
        self.warranty = warranty
        self.certifications = certifications
        self.offset = offset
        self.scale = scale
        self.isFavorite = isFavorite
    }

    var id: UUID
    var name: String
    var brand: String
    var size: [Int]
    var price: Double
    var desc: String
    var model3DName: String
    var type: String
    var materials: [String]
    var origin: String
    var gender: String
    var weight: Double
    var colors: [String]
    var warranty: Int
    var certifications: [String]
    var offset: Offset
    var scale: Double
    var isFavorite: Bool
}

extension ShoeModelDTO {
    var toPresentation: ShoeModel { ShoeModel(id: UUID(), name: name, brand: brand, size: size, price: price, desc: desc, model3DName: model3DName, type: type, materials: materials, origin: origin, gender: gender, weight: weight, colors: colors, warranty: warranty, certifications: certifications, offset: offset, scale: scale, isFavorite: false) }
}
