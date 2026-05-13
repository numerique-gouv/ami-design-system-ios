import Foundation
import SwiftUI

// from: https://jacobzivandesign.com/technology/custom-fonts-from-swift-package/
public enum FontLoader {
    fileprivate static func registerFont(fontURL: URL) {
        guard let fontDataProvider = CGDataProvider(url: fontURL as CFURL),
              let fontRef = CGFont(fontDataProvider) else {
            print("[FontLoader]: Failed to load font: '\(fontURL)': 'fontDataProvider' or 'fontRef' is nil")
            return
        }

        var fontError: Unmanaged<CFError>?

        if CTFontManagerRegisterGraphicsFont(fontRef, &fontError),
           let postScriptName = fontRef.postScriptName {
            print("[FontLoader]: Successfully loaded font: '\(postScriptName)'.")
        } else if let fontError = fontError?.takeRetainedValue() {
            let errorDescription = CFErrorCopyDescription(fontError)
            print("[FontLoader]: Failed to load font '\(fontURL)': \(String(describing: errorDescription))")
        }
    }

    public static func registerFonts() {
        print("[FontLoader]: Register fonts")
        Bundle.main.urls(forResourcesWithExtension: nil, subdirectory: "fonts")?.forEach {
            registerFont(fontURL: $0)
        }
    }
}
