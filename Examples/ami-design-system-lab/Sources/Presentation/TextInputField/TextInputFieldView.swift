//
//  TextInputFieldView.swift
//  Ami-lab-Production
//
//  Created by Nicolas Buquet on 12/03/2026.
//  Copyright © 2026 DINUM. All rights reserved.
//

import SwiftUI

struct TextInputFieldView: View {
    private let label: String
    private let placeholder: String
    @State private var binding: Binding<String>

    init(label: String, placeholder: String, binding: Binding<String>) {
        self.label = label
        self.placeholder = placeholder
        self.binding = binding
    }

    var body: some View {
        VStack(spacing: 0.0) {
            VStack(alignment: .leading, spacing: 0.0) {
                Text(label)
                    .font(.caption)
                    .padding(.bottom, 8.0)
                TextField(placeholder, text: binding)
                    .font(.subheadline)
            }
            .padding(.horizontal, 16.0)
            .padding(.vertical, 6.0)
            .background(Color(hex: 0xEDEDED))
            Color(hex: 0x3A3A3A)
                .frame(height: 2.0)
        }
    }
}

#Preview {
    var _content = ""
    let binding = Binding {
        _content
    } set: { newValue in
        _content = newValue
    }

    TextInputFieldView(label: "Label",
                       placeholder: "Placeholder",
                       binding: binding)
        .padding()
}
