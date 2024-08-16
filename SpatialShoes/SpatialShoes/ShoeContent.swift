//
//  ShoeContent.swift
//  SpatialShoes
//
//  Created by Silvina Roldan on 16/08/2024.
//

import SwiftUI

struct ShoeContent: View {
    let selectedShoe: ShoeModel
    
    var body: some View {
        Button {
            //
        } label: {
            Text("View \(selectedShoe.name)")
        }

    }
}

#Preview {
    ShoeContent(selectedShoe: .test)
}
