//
//  ShoeDetail.swift
//  SpatialShoes
//
//  Created by Silvina Roldan on 08/08/2024.
//

import SwiftUI

struct ShoeDetail: View {
   let selectedShoe: ShoeModel
    
    var body: some View {
        Form {
            LabeledContent("Brand:", value: "\(selectedShoe.brand)")
        }
        .navigationTitle(selectedShoe.name)
    }
}

#Preview {
    ShoeDetail(selectedShoe: ShoeModel.test)
}
