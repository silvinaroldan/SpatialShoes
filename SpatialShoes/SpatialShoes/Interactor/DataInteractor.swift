//
//  DataInteractor.swift
//  SpatialShoes
//
//  Created by Silvina Roldan on 07/08/2024.
//

import Foundation

protocol DataInteractor: JSONInteractor {
    var url: URL { get }
    func getShoes() throws -> [ShoeModel]
}

extension DataInteractor {
    var url: URL { Bundle.main.url(forResource: "shoes", withExtension: "json")! }

    func getShoes() throws -> [ShoeModel] {
        return try loadJSON(url: url, type: [ShoeModel].self)
    }
}

struct Interactor: DataInteractor {}
