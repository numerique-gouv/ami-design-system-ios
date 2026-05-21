//
//  ButtonStyleDsfr.swift
//  AMI-lab-xcodegen
//
//  Created by Nicolas Buquet on 09/03/2026.
//  Copyright © 2026 DINUM. All rights reserved.
//

import SwiftUI

public struct ButtonStyleDsfr: ButtonStyle {
    private static let CORNER_RADIUS = 0.0
    private static let PADDING = 16.0

    public enum ButtonStyleDsfrType {
        case primary
        case secondary
    }

    private let type: ButtonStyleDsfrType

    public init(type: ButtonStyleDsfrType) {
        self.type = type
    }
    
    private func color(configuration: Configuration) -> Color {
        switch type {
        case .primary: .white
        case .secondary: AmiDesignSystem.Colors.Text.Action.High.blueFrance.swiftUIColor.opacity(configuration.isPressed ? 0.5 : 1.0)
        }
    }

    private func backgroundColor(configuration: Configuration) -> Color {
        switch type {
        case .primary: Color(asset: AmiDesignSystem.Colors.Background.Active.blueFrance).opacity(configuration.isPressed ? 0.5 : 1.0)
        case .secondary: .white
        }
    }

    @ViewBuilder
    private func background(configuration: Configuration) -> some View {
        switch type {
        case .primary: RoundedRectangle(cornerRadius: Self.CORNER_RADIUS).fill(backgroundColor(configuration: configuration))
        case .secondary: RoundedRectangle(cornerRadius: Self.CORNER_RADIUS).stroke(color(configuration: configuration))
        }
    }

    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .fontWeight(.semibold)
            .padding(16.0)
            .padding(Self.PADDING)
            .foregroundColor(color(configuration: configuration))
            .background {
                background(configuration: configuration)
            }
            // Full width
            .frame(maxWidth: .infinity)
            .contentShape(RoundedRectangle(cornerRadius: Self.CORNER_RADIUS))
        // .scaleEffect(configuration.isPressed ? 1.2 : 1)
        // .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}
