//
//  File.swift
//  ami-design-system-ios
//
//  Created by Nicolas Buquet on 21/05/2026.
//

import SwiftUI

public extension Color {
    private static let DSFR_COLOR_NAME = "text/active/blue-france"

    public static let dsfrAccentColor = Color(DSFR_COLOR_NAME, bundle: Bundle.module)
    
    public static func setUIKitAccentColor() {
        UIView.appearance().tintColor = UIColor(named: Color.DSFR_COLOR_NAME, in: Bundle.module, compatibleWith: .current)
    }
}
