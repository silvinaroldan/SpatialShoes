//
//  ShoeModelDTO.swift
//  SpatialShoes
//
//  Created by Silvina Roldan on 06/12/2024.
//

import Foundation

struct ShoeModelDTO: Codable {
    
    let id: Int
    let name: String
    let brand: String
    let size: [Int]
    let price: Double
    let desc: String
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
    
    enum CodingKeys: String, CodingKey {
        case id, name, brand, size, price, model3DName, type, materials, origin, gender, weight, colors, warranty, certifications, offset, scale
        case desc = "description"
    }
}
