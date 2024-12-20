//
//  ShoesViewModel.swift
//  SpatialShoes
//
//  Created by Silvina Roldan on 07/08/2024.
//
import SwiftUI
import SwiftData

@Observable
final class ShoesVM {
    var selectedShoe: ShoeModel?
    let network = Network()
    
    var shoes: [ShoeModel] = []
    
    init() {
        Task {
            await getShoes()
        }
    }
    
    @MainActor
    func getShoes() async {
        do {
            shoes = try await network.getShoes()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func toggleFavorite(shoe: ShoeModel, context: ModelContext) throws {
        let id = shoe.id
        let query = FetchDescriptor<ShoeDataModel>(predicate:
            #Predicate { $0.id == id }
        )
        if let fetch = try context.fetch(query).first {
            context.delete(fetch)
        } else {
            let newShoe = ShoeDataModel(id: shoe.id, name: shoe.name, brand: shoe.brand, size: shoe.size, price: shoe.price, desc: shoe.desc, model3DName: shoe.model3DName, type: shoe.type, materials: shoe.materials, origin: shoe.origin, gender: shoe.gender, weight: shoe.weight, colors: shoe.colors, warranty: shoe.warranty, certifications: shoe.certifications,offset: shoe.offset, scale: shoe.scale)
            context.insert(newShoe)
        }
    }
    
    func getFavoriteShoes(context: ModelContext) throws -> [ShoeDataModel] {
        let query = FetchDescriptor<ShoeDataModel>()
        return try context.fetch(query)
    }
    
    func getShoe(id: Int) -> ShoeModel? {
        return shoes.first { $0.id == id }
    }
}



//    In case we need to add / remove or get a shoe from the database this is the
//    code to do it
//
//
//    func getShoe(id: Int, context: ModelContext) throws -> ShoeDataModel? {
//        let predicate = #Predicate<ShoeDataModel> { $0.id == id }
//        return try context.fetch(FetchDescriptor<ShoeDataModel>(predicate: predicate)).first
//    }
//
//    func deleteShoe(indexes: IndexSet, shoes: [ShoeDataModel], context: ModelContext) {
//        for index in indexes {
//            context.delete(shoes[index])
//        }
//        try? context.save()
//    }
//
//    func createShoe(shoe: ShoeDataModel, context: ModelContext) throws {
//        context.insert(shoe)
//        try context.save()
//    }
