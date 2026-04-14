//
//  Font.swift
//  Ami-lab-Production
//
//  Created by Nicolas Buquet on 27/03/2026.
//  Copyright © 2026 DINUM. All rights reserved.
//

import Foundation
import SwiftUI

public extension Font {
    // Thin is weight 100
    private static let dsfrFontThinFontname = "Marianne-Thin"
    private static let dsfrFontThinItalicFontname = "Marianne-ThinItalic"
    // Light is weight 300
    private static let dsfrFontLightFontname = "Marianne-Light"
    private static let dsfrFontLightItalicFontname = "Marianne-LightItalic"
    // Regular is weight 400
    private static let dsfrFontRegularFontname = "Marianne-Regular"
    private static let dsfrFontRegularItalicFontname = "Marianne-RegularItalic"
    // Medium is weight 500
    private static let dsfrFontMediumFontname = "Marianne-Medium"
    private static let dsfrFontMediumItalicFontname = "Marianne-MediumItalic"
    // Bold is weight 700
    private static let dsfrFontBoldFontname = "Marianne-Bold"
    private static let dsfrFontBoldItalicFontname = "Marianne-BoldItalic"
    // Extra is weight 900
    private static let dsfrFontExtraFontname = "Marianne-ExtraBold"
    private static let dsfrFontExtraItalicFontname = "Marianne-ExtraBoldItalic"

    static let dsfrH1 = Font.custom(dsfrFontBoldFontname, size: 32.0, relativeTo: .largeTitle)
    static let dsfrH2 = Font.custom(dsfrFontBoldFontname, size: 28.0, relativeTo: .title)
    static let dsfrH3 = Font.custom(dsfrFontBoldFontname, size: 24.0, relativeTo: .title)
    static let dsfrH4 = Font.custom(dsfrFontBoldFontname, size: 22.0, relativeTo: .title2)
    static let dsfrH5 = Font.custom(dsfrFontBoldFontname, size: 20.0, relativeTo: .title2)
    static let dsfrH6 = Font.custom(dsfrFontBoldFontname, size: 18.0, relativeTo: .title3)

    static let dsfrDisplayXL = Font.custom(dsfrFontBoldFontname, size: 72.0, relativeTo: .largeTitle)
    static let dsfrDisplayLG = Font.custom(dsfrFontBoldFontname, size: 64.0, relativeTo: .largeTitle)
    static let dsfrDisplayMD = Font.custom(dsfrFontBoldFontname, size: 56.0, relativeTo: .largeTitle)
    static let dsfrDisplaySM = Font.custom(dsfrFontBoldFontname, size: 48.0, relativeTo: .largeTitle)
    static let dsfrDisplayXS = Font.custom(dsfrFontBoldFontname, size: 40.0, relativeTo: .largeTitle)

    static let dsfrTextXL = Font.custom(dsfrFontRegularFontname, size: 20.0, relativeTo: .title2)
    static let dsfrTextLG = Font.custom(dsfrFontRegularFontname, size: 18.0, relativeTo: .title2)
    static let dsfrTextMD = Font.custom(dsfrFontRegularFontname, size: 16.0, relativeTo: .title3)
    static let dsfrTextSM = Font.custom(dsfrFontRegularFontname, size: 14.0, relativeTo: .headline)
    static let dsfrTextXS = Font.custom(dsfrFontRegularFontname, size: 12.0, relativeTo: .footnote)
}
