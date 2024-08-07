//
//  JSONInteractor.swift
//  SpatialShoes
//
//  Created by Silvina Roldan on 07/08/2024.
//

import Foundation

protocol JSONInteractor {
    func loadJSON<JSON>(url: URL, type: JSON.Type) throws -> JSON where JSON: Codable
}


extension JSONInteractor {
    func loadJSON<JSON>(url: URL, type: JSON.Type) throws -> JSON where JSON: Codable {
        let data = try Data(contentsOf: url)
        return try JSONDecoder().decode(type, from: data)
    }
}
