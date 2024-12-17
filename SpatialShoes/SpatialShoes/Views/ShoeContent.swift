//
//  ShoeContent.swift
//  SpatialShoes
//
//  Created by Silvina Roldan on 16/08/2024.
//

import SwiftUI

struct ShoeContent: View {
    let selectedShoe: ShoeDataModel

    var body: some View {
        Form {
            Section {
                if let attributedString = try? AttributedString(markdown: selectedShoe.desc, options: AttributedString.MarkdownParsingOptions(interpretedSyntax: .inlineOnlyPreservingWhitespace)) {
                    Text(attributedString)
                }
            } header: {
                Text("Descripción")
            }

            Section {
                LabeledContent("**Marca**", value: "\(selectedShoe.brand)")
                LabeledContent("**Tamaño**", value: selectedShoe.size.map { String($0) }.formatted(.list(type: .and)))
                LabeledContent("**Precio**", value: "\(selectedShoe.price)")
                LabeledContent("**Tipo**", value: "\(selectedShoe.type)")
                LabeledContent("**Género**", value: "\(selectedShoe.gender)")
                LabeledContent("**Peso**", value: "\(selectedShoe.weight)")
                LabeledContent("**Origen**", value: "\(selectedShoe.origin)")
                LabeledContent("**Garantía**", value: "\(selectedShoe.warranty)")
                LabeledContent("**Certificaciones**", value: selectedShoe.certifications.formatted(.list(type: .and)))
                LabeledContent("**Colores**", value: selectedShoe.colors.formatted(.list(type: .and)))
                LabeledContent("**Materiales**", value: selectedShoe.materials.formatted(.list(type: .and)))
            }
        }
        .navigationTitle(selectedShoe.name)
    }
}

#Preview {
    ShoeContent(selectedShoe: .test)
}
