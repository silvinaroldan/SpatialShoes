//
//  URL.swift
//  EmpleadosSwiftTesting
//
//  Created by Julio César Fernández Muñoz on 13/12/24.
//

import Foundation

extension URL {
    static var getShoes: URL { Bundle.main.url(forResource: "shoes", withExtension: "json")! }
}

