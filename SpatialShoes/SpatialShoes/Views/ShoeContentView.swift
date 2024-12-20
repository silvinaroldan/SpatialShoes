//
//  ShoeContent.swift
//  SpatialShoes
//
//  Created by Silvina Roldan on 16/08/2024.
//

import SwiftUI

struct ShoeContentView: View {
    let selectedShoe: ShoeModel

    var body: some View {
        Form {
            Section {
                if let attributedString = try? AttributedString(markdown: selectedShoe.desc, options: AttributedString.MarkdownParsingOptions(interpretedSyntax: .inlineOnlyPreservingWhitespace)) {
                    Text(attributedString)
                }
            } header: {
                Text("Description")
            }

            Section {
                LabeledContent("**Brand**", value: "\(selectedShoe.brand)")
                LabeledContent("**Size**", value: selectedShoe.size.map { String($0) }.formatted(.list(type: .and)))
                LabeledContent("**Price**", value: "\(selectedShoe.price)")
                LabeledContent("**Type**", value: "\(selectedShoe.type)")
                LabeledContent("**Gender**", value: "\(selectedShoe.gender)")
                LabeledContent("**Weight**", value: "\(selectedShoe.weight)")
                LabeledContent("**Origin**", value: "\(selectedShoe.origin)")
                LabeledContent("**Warranty**", value: "\(selectedShoe.warranty)")
                LabeledContent("**Certifications**", value: selectedShoe.certifications.formatted(.list(type: .and)))
                LabeledContent("**Colors**", value: selectedShoe.colors.formatted(.list(type: .and)))
                LabeledContent("**Materials**", value: selectedShoe.materials.formatted(.list(type: .and)))
            }
        }
        .navigationTitle(selectedShoe.name)
    }
}

#Preview {
    ShoeContentView(selectedShoe: .test)
}
