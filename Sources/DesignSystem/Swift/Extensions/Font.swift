//
//  Font.swift
//  Ami-lab-Production
//
//  Created by Nicolas Buquet on 27/03/2026.
//  Copyright © 2026 DINUM. All rights reserved.
//

import Foundation
import SwiftUI

private extension Font {
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

    static let dsfrH1 = Font.custom(dsfrFontBoldFontname, size: DsfrFont.h1.fontSize, relativeTo: .largeTitle)
    static let dsfrH2 = Font.custom(dsfrFontBoldFontname, size: DsfrFont.h2.fontSize, relativeTo: .title)
    static let dsfrH3 = Font.custom(dsfrFontBoldFontname, size: DsfrFont.h3.fontSize, relativeTo: .title)
    static let dsfrH4 = Font.custom(dsfrFontBoldFontname, size: DsfrFont.h4.fontSize, relativeTo: .title2)
    static let dsfrH5 = Font.custom(dsfrFontBoldFontname, size: DsfrFont.h5.fontSize, relativeTo: .title2)
    static let dsfrH6 = Font.custom(dsfrFontBoldFontname, size: DsfrFont.h6.fontSize, relativeTo: .title3)

//    private static let dsfrDisplayXL = Font.custom(dsfrFontBoldFontname, size: 72.0, relativeTo: .largeTitle)
//    private static let dsfrDisplayLG = Font.custom(dsfrFontBoldFontname, size: 64.0, relativeTo: .largeTitle)
//    private static let dsfrDisplayMD = Font.custom(dsfrFontBoldFontname, size: 56.0, relativeTo: .largeTitle)
//    private static let dsfrDisplaySM = Font.custom(dsfrFontBoldFontname, size: 48.0, relativeTo: .largeTitle)
//    private static let dsfrDisplayXS = Font.custom(dsfrFontBoldFontname, size: 40.0, relativeTo: .largeTitle)

    static let dsfrTextXL = Font.custom(dsfrFontRegularFontname, size: DsfrFont.textXL.fontSize, relativeTo: .title2)
    static let dsfrTextLG = Font.custom(dsfrFontRegularFontname, size: DsfrFont.textLG.fontSize, relativeTo: .title2)
    static let dsfrTextMD = Font.custom(dsfrFontRegularFontname, size: DsfrFont.textMD.fontSize, relativeTo: .title3)
    static let dsfrTextSM = Font.custom(dsfrFontRegularFontname, size: DsfrFont.textSM.fontSize, relativeTo: .headline)
    static let dsfrTextXS = Font.custom(dsfrFontRegularFontname, size: DsfrFont.textXS.fontSize, relativeTo: .footnote)
    
    static let buttonLabel = Font.custom(dsfrFontMediumFontname, size: DsfrFont.buttonLabel.fontSize, relativeTo: .title)
}

public enum DsfrFont {
    case h1, h2, h3, h4, h5, h6
    case textXL, textLG, textMD, textSM, textXS
    case buttonLabel
    
    public var font: Font {
        switch self {
        case .h1: .dsfrH1
        case .h2: .dsfrH2
        case .h3: .dsfrH3
        case .h4: .dsfrH4
        case .h5: .dsfrH5
        case .h6: .dsfrH6

        case .textXL: .dsfrTextXL
        case .textLG: .dsfrTextLG
        case .textMD: .dsfrTextMD
        case .textSM: .dsfrTextSM
        case .textXS: .dsfrTextXS
            
        case .buttonLabel: .buttonLabel
        }
    }
    
    fileprivate var fontSize: CGFloat {
        switch self {
        case .h1: 30.0
        case .h2: 28.0
        case .h3: 24.0
        case .h4: 22.0
        case .h5: 20.0
        case .h6: 18.0
            
        case .textXL: 20.0
        case .textLG: 18.0
        case .textMD: 16.0
        case .textSM: 14.0
        case .textXS: 12.0
            
        case .buttonLabel: 18.0
        }
    }

    fileprivate var lineHeight: CGFloat {
        switch self {
        case .h1: 40.0
        case .h2: 36.0
        case .h3: 32.0
        case .h4: 28.0
        case .h5: 28.0
        case .h6: 24.0
            
        case .textXL: 32.0
        case .textLG: 28.0
        case .textMD: 24.0
        case .textSM: 24.0
        case .textXS: 20.0
            
        case .buttonLabel: 24.0
        }
    }
    

    @available(iOS 26, *)
    public var lineHeightMultiplier: CGFloat {
        self.lineHeight / self.fontSize
    }
    
    public var lineSpacing: CGFloat {
        self.lineHeight - self.fontSize
    }
}

private struct DsfrFontModifier: ViewModifier {
    let dsfrFont: DsfrFont
    
    public func body(content: Content) -> some View {
        if #available(iOS 26, *) {
            content
                .font(dsfrFont.font)
//                .lineHeight(.exact(points: dsfrFont.lineHeight))
                .lineSpacing(dsfrFont.lineSpacing)
        } else {
            content
                .font(dsfrFont.font)
                .lineSpacing(dsfrFont.lineSpacing)
        }
    }
}

public extension View {
    func dsfrFont(_ dsfrFont: DsfrFont) -> some View {
        modifier(DsfrFontModifier(dsfrFont: dsfrFont))
    }
}
