//
//  MeasureSize.swift
//  AMI-lab-xcodegen
//
//  Created by Nicolas Buquet on 14/03/2026.
//  Copyright © 2026 DINUM. All rights reserved.
//

// from: https://www.codegenes.net/blog/measure-the-rendered-size-of-a-swiftui-view/
import SwiftUI

// Define a preference key to store a CGSize
struct SizePreferenceKey: PreferenceKey {
    static var defaultValue: CGSize = .zero

    // Combine values if multiple children set the preference (use first/last/max as needed)
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = nextValue() // Use the latest value
    }
}

// Extension to simplify attaching the size-measuring background
extension View {
    func measureSize(perform action: @escaping (CGSize) -> Void) -> some View {
        // Use `overlay` and not `background`. Size returned with `background` is always (0.0, 0.0).
        overlay(
            GeometryReader { geometry in
                Color.clear // Invisible overlay to avoid affecting layout
                    .preference(key: SizePreferenceKey.self, value: geometry.size)
            }
        )
        .onPreferenceChange(SizePreferenceKey.self, perform: action)
    }
}

// Usage example
//
// struct ChildSizeExample: View {
//     @State private var textSize: CGSize = .zero
//
//     var body: some View {
//         VStack {
//             Text("Measure my size!")
//                 .font(.headline)
//                 .measureSize { size in
//                     textSize = size // Update state with the child's size
//                 }
//
//             Text("Text size: \(textSize.width)x\(textSize.height)")
//         }
//     }
// }
