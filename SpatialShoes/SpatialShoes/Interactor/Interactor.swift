//
//  Network.swift
//  EmpleadosSwiftTesting
//
//  Created by Julio César Fernández Muñoz on 13/12/24.
//

import Foundation

protocol Interactor {
    var session: URLSession { get }
}

extension Interactor {
    func getJSON<JSON>(from url: URL, type: JSON.Type) async throws -> JSON where JSON: Codable {
        let (data, _) = try await session.data(from: url)
        return try JSONDecoder().decode(type, from: data)
        
    }
}
