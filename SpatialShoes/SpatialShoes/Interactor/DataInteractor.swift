//
//  DataInteractor.swift
//  SpatialShoes
//
//  Created by Silvina Roldan on 07/08/2024.
//

import Foundation

protocol DataInteractor {
    var url: URL { get }
    func getShoes() throws -> [ShoeModel]
}

extension DataInteractor {
    var url: URL { Bundle.main.url(forResource: "shoes", withExtension: "json")!}
}

struct Interactor: JSONInteractor, DataInteractor {
    static let shared = Interactor()
    
    func getShoes() throws -> [ShoeModel] {
        return try loadJSON(url: url, type: [ShoeModel].self)
    }
}
