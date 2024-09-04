//
//  ShoeContent.swift
//  SpatialShoes
//
//  Created by Silvina Roldan on 16/08/2024.
//

import SwiftUI

struct ShoeContent: View {
    let selectedShoe: ShoeModel
    @Environment(\.openWindow) private var open

    var body: some View {
        Button {
            open(id: "shoe3D")
        } label: {
            Text("View \(selectedShoe.name)")
        }
    }
}

#Preview {
    ShoeContent(selectedShoe: .test)
}
