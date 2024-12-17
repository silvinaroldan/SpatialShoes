//
//  DataConnection.swift
//  EmpleadosSwiftTesting
//
//  Created by Roldan Silvina Muñoz on 16/12/24.
//

import Foundation

struct Network: DataRepository {
    let actor: APIActor
    
    init(actor: APIActor = .shared) {
        self.actor = actor
    }
    
    func getShoes() async throws -> [ShoeModel] {
        try await actor.getJSON(from: .getShoes, type: [ShoeModel].self)
    }
}
