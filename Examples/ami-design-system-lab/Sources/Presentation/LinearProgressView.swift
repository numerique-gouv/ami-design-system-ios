//
//  LinearProgressView.swift
//  AMI-lab-xcodegen
//
//  Created by Nicolas Buquet on 18/03/2026.
//  Copyright © 2026 DINUM. All rights reserved.
//

import SwiftUI

struct LinearProgressView<Shape: SwiftUI.Shape>: View {
    var value: Double
    var shape: Shape

    init(value: Double, shape: Shape = Capsule()) {
        self.value = value
        self.shape = shape
    }

    var body: some View {
        shape.fill(Color(hex: 0xEDEDED))
            .overlay(alignment: .leading) {
                GeometryReader { proxy in
                    shape.fill(.tint)
                        .frame(width: proxy.size.width * value)
                }
            }
            .clipShape(shape)
    }
}

#Preview {
    VStack {
        LinearProgressView(value: 0.2, shape: Rectangle())
            .tint(Gradient(colors: [.orange, .red]))

        LinearProgressView(value: 0.6, shape: Capsule())
            .tint(Gradient(colors: [.purple, .blue]))

        LinearProgressView(value: 0.8, shape: RoundedRectangle(cornerRadius: 4))
            .tint(LinearGradient(colors: [.green, .cyan], startPoint: .leading, endPoint: .trailing))
    }
    .frame(height: 64)
    .padding()
}
