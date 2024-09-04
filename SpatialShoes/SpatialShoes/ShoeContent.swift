//
//  ShoeContent.swift
//  SpatialShoes
//
//  Created by Silvina Roldan on 16/08/2024.
//

import SwiftUI

struct ShoeContent: View {
    // TODO: - Format text
    // TODO: - Add Localization
    let selectedShoe: ShoeModel

    var body: some View {
        Form {
            Section {
                Text(selectedShoe.description)
            } header: {
                Text("Descripcion")
            }

            Section {
                LabeledContent("**Brand**", value: "\(selectedShoe.brand)")
                LabeledContent("**Size**", value: "\(selectedShoe.size)")
                LabeledContent("**Price**", value: "\(selectedShoe.price)")
                LabeledContent("**Type**", value: "\(selectedShoe.type)")
                LabeledContent("**Gender**", value: "\(selectedShoe.gender)")
                LabeledContent("**Weight**", value: "\(selectedShoe.weight)")
                LabeledContent("**Origin**", value: "\(selectedShoe.origin)")
                LabeledContent("**Warranty**", value: "\(selectedShoe.warranty)")
                LabeledContent("**Certifications**", value: selectedShoe.certifications.formatted(.list(type: .and)))
                LabeledContent("**Colors**", value: selectedShoe.colors.formatted(.list(type: .and)))
                LabeledContent("**Materials**", value: selectedShoe.materials.formatted(.list(type: .and)))
            } header: {
                Text("Shoe info")
            }
        }
        .navigationTitle(selectedShoe.name)
    }
}

#Preview {
    ShoeContent(selectedShoe: .test)
}
