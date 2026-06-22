//
//  File.swift
//  ami-design-system-ios
//
//  Created by Nicolas Buquet on 21/05/2026.
//

import SwiftUI
#if os(macOS)
  import AppKit
#elseif os(iOS)
  import UIKit
#endif

public extension Color {
    private static let DSFR_COLOR_NAME = "text/active/blue-france"

    static let dsfrAccentColor = Color(DSFR_COLOR_NAME, bundle: Bundle.module)
    
    static func setUIKitAccentColor() {
        #if os(iOS)
            UIView.appearance().tintColor = UIColor(named: Color.DSFR_COLOR_NAME, in: Bundle.module, compatibleWith: .current)
        #endif
    }
}
