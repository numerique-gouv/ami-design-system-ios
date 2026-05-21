//
//  ButtonStyleDsfr.swift
//  AMI-lab-xcodegen
//
//  Created by Nicolas Buquet on 09/03/2026.
//  Copyright © 2026 DINUM. All rights reserved.
//

import SwiftUI

public struct ButtonStyleDsfr: ButtonStyle {
    // Declare Environment variable to know if button is enabled or disabled.
    @Environment(\.isEnabled) private var isEnabled

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
        case .primary:
            if isEnabled {
                Color(asset: AmiDesignSystem.Colors.Background.Active.blueFrance).opacity(configuration.isPressed ? 0.5 : 1.0)
            } else {
                Color(asset: AmiDesignSystem.Colors.Background.Disabled.grey)
            }
        case .secondary:
            if isEnabled {
                .white
            } else {
                Color(asset: AmiDesignSystem.Colors.Background.Disabled.grey)
            }
        }
    }

    @ViewBuilder
    private func background(configuration: Configuration) -> some View {
        switch type {
        case .primary: RoundedRectangle(cornerRadius: Self.CORNER_RADIUS).fill(backgroundColor(configuration: configuration))
        case .secondary: RoundedRectangle(cornerRadius: Self.CORNER_RADIUS).stroke(color(configuration: configuration))
        }
    }

    private var labelColor: Color {
        switch type {
        case .primary:
            (isEnabled ? AmiDesignSystem.Colors.Text.Inverted.blueFrance : AmiDesignSystem.Colors.Text.Disabled.grey).swiftUIColor
        case .secondary:
            (isEnabled ? AmiDesignSystem.Colors.Text.Action.High.blueFrance : AmiDesignSystem.Colors.Text.Disabled.grey).swiftUIColor
        }
    }
    
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .dsfrFont(.buttonLabel)
            .foregroundStyle(labelColor)
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
