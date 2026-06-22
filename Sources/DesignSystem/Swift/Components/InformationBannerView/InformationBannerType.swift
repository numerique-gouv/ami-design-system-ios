//
//  InformationBannerType.swift
//  ami-design-system-ios
//
//  Created by Nicolas Buquet on 22/06/2026.
//

import Foundation
import SwiftUI

public enum InformationBannerType {
    case warning
    case information
    case error
    case validation

    var defaultIcon: DsfrImageAsset {
        switch self {
        case .warning: AmiDesignSystem.Icons.System.alertFill // exclamationmark.triangle.fill
        case .information: AmiDesignSystem.Icons.System.frInfoFill // info.square.fill
        case .error: AmiDesignSystem.Icons.System.closeCircleFill // xmark.circle.fill
        case .validation: AmiDesignSystem.Icons.System.checkboxCircleFill // checkmark.circle.fill
        }
    }

    var backgroundColor: Color {
        switch self {
        case .warning: AmiDesignSystem.Colors.Background.Contrast.yellowMoutarde.swiftUIColor
        case .information: AmiDesignSystem.Colors.Background.Contrast.info.swiftUIColor
        case .error: AmiDesignSystem.Colors.Background.Contrast.error.swiftUIColor
        case .validation: AmiDesignSystem.Colors.Background.Contrast.greenEmeraude.swiftUIColor
        }
    }

    var foregroundColor: Color {
        switch self {
        case .warning: AmiDesignSystem.Colors.Text.Default.warning.swiftUIColor
        case .information: AmiDesignSystem.Colors.Text.Default.info.swiftUIColor
        case .error: AmiDesignSystem.Colors.Text.Default.error.swiftUIColor
        case .validation: AmiDesignSystem.Colors.Text.Default.success.swiftUIColor
        }
    }
}
