//
//  ShoeModel.swift
//  SpatialShoes
//
//  Created by Silvina Roldan on 07/08/2024.
//

import Foundation
import SwiftData

struct Offset: Codable, Identifiable, Hashable {
    var id: UUID { UUID() }
    let x: Double
    let y: Double
}

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
    let offset: Offset
    let scale: Double
}
