//
//  ShoeModelMetadata.swift
//  SpatialShoes
//
//  Created by Silvina Roldan on 12/09/2024.
//

import SwiftUI
import SwiftData

@Model
class ShoeModelMetadata {
    @Attribute(.unique) var id: Int
    var isFavorite: Bool

    init(id: Int, isFavorite: Bool) {
        self.id = id
        self.isFavorite = isFavorite
    }
}
