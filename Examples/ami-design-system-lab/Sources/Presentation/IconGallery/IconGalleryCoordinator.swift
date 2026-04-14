//
//  IconGalleryCoordinator.swift
//  Ami-lab-Production
//
//  Created by Nicolas Buquet on 31/03/2026.
//  Copyright © 2026 DINUM. All rights reserved.
//

import AmiDesignSystem
import Foundation
import SwiftUI

final class IconGalleryCoordinator: AnyCoordinator {
    private let viewModel: ItemGalleryViewModel<DsfrImageAsset>!

    required init(viewModel: ItemGalleryViewModel<DsfrImageAsset>) {
        self.viewModel = viewModel
    }

    override func prepare(router: Router) {}

    override func toView() -> AnyView {
        AnyView(IconGalleryView(viewModel: viewModel))
    }
}
