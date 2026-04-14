//
//  FontGalleryCoordinator.swift
//  Ami-lab-Production
//
//  Created by Nicolas Buquet on 27/03/2026.
//  Copyright © 2026 DINUM. All rights reserved.
//

import Foundation
import SwiftUI

final class FontGalleryCoordinator: AnyCoordinator {
    private let viewModel: FontGalleryViewModel!

    required init(viewModel: FontGalleryViewModel) {
        self.viewModel = viewModel
    }

    override func prepare(router: Router) {}

    override func toView() -> AnyView {
        AnyView(FontGalleryView(viewModel: viewModel))
    }
}
