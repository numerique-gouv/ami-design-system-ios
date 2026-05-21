//
//  ButtonGalleryCoordinator.swift
//  Ami-lab-Production
//
//  Created by Nicolas Buquet on 07/03/2026.
//  Copyright © 2026 DINUM. All rights reserved.
//

import Foundation
import SwiftUI

final class ButtonGalleryCoordinator: AnyCoordinator {
    private let viewModel: ButtonGalleryViewModel!

    required init(viewModel: ButtonGalleryViewModel) {
        self.viewModel = viewModel
    }

    override func prepare(router: Router) {
        viewModel.processAction = { action in
            switch action {
            case .primaryAction:
                break
            case .secondaryAction:
                router.pop()
            }
        }
    }

    override func toView() -> AnyView {
        AnyView(ButtonGalleryView(viewModel: viewModel))
    }

    func continueFormFlow(router: Router) {
        let viewModel = FormPart02ViewModel()
        viewModel.actionIsConfirmed = self.viewModel.actionIsConfirmed
        let coordinator = FormPart02Coordinator(viewModel: viewModel)
        coordinator.prepare(router: router)
        router.presentSheet(coordinator: nil)
        router.push(coordinator: coordinator)
    }
}
