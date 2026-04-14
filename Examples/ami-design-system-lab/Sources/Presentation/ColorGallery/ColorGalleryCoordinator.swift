//
//  ColorGalleryCoordinator.swift
//  Ami-lab-Production
//
//  Created by Nicolas Buquet on 27/03/2026.
//  Copyright © 2026 DINUM. All rights reserved.
//

import AmiDesignSystem
import Foundation
import SwiftUI

final class ColorGalleryCoordinator: AnyCoordinator {
    private let viewModel: ItemGalleryViewModel<DsfrColorAsset>!

    required init(viewModel: ItemGalleryViewModel<DsfrColorAsset>) {
        self.viewModel = viewModel
    }

    override func prepare(router: Router) {}

    override func toView() -> AnyView {
        AnyView(ColorGalleryView(viewModel: viewModel))
    }
}
