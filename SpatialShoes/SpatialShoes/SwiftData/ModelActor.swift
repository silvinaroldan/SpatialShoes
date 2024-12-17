//
//  ModelActor.swift
//  SpatialShoes
//
//  Created by Silvina Roldan on 14/12/2024.
//

import Foundation
import SwiftData

@ModelActor

// shoeModel is part of the data downloaded from the API or from the local JSON as in this case were the data is retrieved from the local JSON file called shoes.json
// shoeDataModel is the representation of the shoeModel in the local database

actor BackgroundDataManager {
    func processShoeData(_ shoes: [ShoeModel]) throws {
        for shoe in shoes {
            if let _ = try getShoe(id: shoe.id, context: modelContext) {
                continue
            } else {
                try saveShoe(from: shoe)
            }
        }

        try modelContext.save()
    }

    private func saveShoe(from shoe: ShoeModel) throws {
        let shoe = ShoeDataModel(id: shoe.id, name: shoe.name, brand: shoe.brand, size: shoe.size, price: shoe.price, desc: shoe.desc, model3DName: shoe.model3DName, type: shoe.type, materials: shoe.materials, origin: shoe.origin, gender: shoe.gender, weight: shoe.weight, colors: shoe.colors, warranty: shoe.warranty, certifications: shoe.certifications, offset: shoe.offset, scale: shoe.scale, isFavorite: false)

        modelContext.insert(shoe)
    }

    private func getShoe(id: Int, context: ModelContext) throws -> ShoeDataModel? {
        let predicate = #Predicate<ShoeDataModel> { $0.id == id }
        return try context.fetch(FetchDescriptor<ShoeDataModel>(predicate: predicate)).first
    }
}
