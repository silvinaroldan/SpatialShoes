//
//  ShoeModel.swift
//  SpatialShoes
//
//  Created by Silvina Roldan on 07/08/2024.
//

import Foundation

struct ShoeModel: Codable, Identifiable, Hashable {
    let id: Int
    let name: String
    let brand: String
    let size: [Int]
    let price: Double
    let description: String
    let model3DName: String
    let type: String
    let materials: [String]
    let origin: String
    let gender: String
    let weight: Double
    let colors: [String]
    let warranty: Int
    let certifications: [String]
    
    var favoriteKey: String {
        "Favorite-\(id)"
    }
}
