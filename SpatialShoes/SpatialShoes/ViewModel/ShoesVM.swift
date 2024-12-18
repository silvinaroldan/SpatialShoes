//
//  ShoesViewModel.swift
//  SpatialShoes
//
//  Created by Silvina Roldan on 07/08/2024.
//
import SwiftUI
import SwiftData

@Observable @MainActor
final class ShoesVM {
    var selectedShoe: ShoeModel?
    let network = Network()
    
    var shoes: [ShoeModel] = []
    
    init() {
        Task {
            await getShoes()
        }
    }
    
    func getShoes() async {
        do {
            shoes = try await network.getShoes()
        } catch {
            print(error.localizedDescription)
        }
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
