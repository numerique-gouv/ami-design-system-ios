//
//  FontGalleryViewModel.swift
//  Ami-lab-Production
//
//  Created by Nicolas Buquet on 27/03/2026.
//  Copyright © 2026 DINUM. All rights reserved.
//

import AmiDesignSystem
import Foundation
import SwiftUI

final class FontGalleryViewModel: ObservableObject {
    private static let standardPhrase = """
    Lorem ipsum dolor sit amet consectetur adipiscing elit. Quisque faucibus ex sapien vitae pellentesque sem placerat. In id cursus mi pretium tellus duis convallis. Tempus leo eu aenean sed diam urna tempor. Pulvinar vivamus fringilla lacus nec metus bibendum egestas. Iaculis massa nisl malesuada lacinia integer nunc posuere. Ut hendrerit semper vel class aptent taciti sociosqu. Ad litora torquent per conubia nostra inceptos himenaeos.

    Lorem ipsum dolor sit amet consectetur adipiscing elit. Quisque faucibus ex sapien vitae pellentesque sem placerat. In id cursus mi pretium tellus duis convallis. Tempus leo eu aenean sed diam urna tempor. Pulvinar vivamus fringilla lacus nec metus bibendum egestas. Iaculis massa nisl malesuada lacinia integer nunc posuere. Ut hendrerit semper vel class aptent taciti sociosqu. Ad litora torquent per conubia nostra inceptos himenaeos.
    """

    struct Item {
        let text: String
        let typeLabel: String
        let font: DsfrFont
    }

    let items = [
        Item(text: FontGalleryViewModel.standardPhrase, typeLabel: "dsfr-Text-XL", font: .textXL),
        Item(text: FontGalleryViewModel.standardPhrase, typeLabel: "dsfr-Text-LG", font: .textLG),
        Item(text: FontGalleryViewModel.standardPhrase, typeLabel: "dsfr-Text-MD", font: .textMD),
        Item(text: FontGalleryViewModel.standardPhrase, typeLabel: "dsfr-Text-SM", font: .textSM),
        Item(text: FontGalleryViewModel.standardPhrase, typeLabel: "dsfr-Text-XS", font: .textXS),
        Item(text: FontGalleryViewModel.standardPhrase, typeLabel: "dsfr-H1", font: .h1),
        Item(text: FontGalleryViewModel.standardPhrase, typeLabel: "dsfr-H2", font: .h2),
        Item(text: FontGalleryViewModel.standardPhrase, typeLabel: "dsfr-H3", font: .h3),
        Item(text: FontGalleryViewModel.standardPhrase, typeLabel: "dsfr-H4", font: .h4),
        Item(text: FontGalleryViewModel.standardPhrase, typeLabel: "dsfr-H5", font: .h5),
        Item(text: FontGalleryViewModel.standardPhrase, typeLabel: "dsfr-H6", font: .h6),
//        Item(text: FontGalleryViewModel.standardPhrase, typeLabel: "dsfr-Display-XL", font: .dsfrDisplayXL),
//        Item(text: FontGalleryViewModel.standardPhrase, typeLabel: "dsfr-Display-LG", font: .dsfrDisplayLG),
//        Item(text: FontGalleryViewModel.standardPhrase, typeLabel: "dsfr-Display-MD", font: .dsfrDisplayMD),
//        Item(text: FontGalleryViewModel.standardPhrase, typeLabel: "dsfr-Display-SM", font: .dsfrDisplaySM),
//        Item(text: FontGalleryViewModel.standardPhrase, typeLabel: "dsfr-Display-XS", font: .dsfrDisplayXS),
    ]
}
