//
//  FormPart01Coordinator.swift
//  Ami-lab-Production
//
//  Created by Nicolas Buquet on 07/03/2026.
//  Copyright © 2026 DINUM. All rights reserved.
//

import Foundation
import SwiftUI

final class FormPart01Coordinator: AnyCoordinator {
    private let viewModel: FormPart01ViewModel!

    required init(viewModel: FormPart01ViewModel) {
        self.viewModel = viewModel
    }

    override func prepare(router: Router) {
        viewModel.processAction = { action in
            switch action {
            case .cancel:
                router.pop()
            case .continue:
                self.continueFormFlow(router: router)
            }
        }
    }

    override func toView() -> AnyView {
        AnyView(FormPart01View(viewModel: viewModel))
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
