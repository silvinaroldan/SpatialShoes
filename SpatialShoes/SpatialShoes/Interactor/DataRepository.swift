//
//  DataInteractor.swift
//  SpatialShoes
//
//  Created by Silvina Roldan on 07/08/2024.
//

import Foundation

protocol DataRepository: Sendable {
    func getShoes() async throws -> [ShoeModel]
}
