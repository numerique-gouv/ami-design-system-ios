//
//  FormPart02Coordinator.swift
//  Ami-lab-Production
//
//  Created by Nicolas Buquet on 07/03/2026.
//  Copyright © 2026 DINUM. All rights reserved.
//

import Foundation
import SwiftUI

final class FormPart02Coordinator: AnyCoordinator {
    private let viewModel: FormPart02ViewModel!

    required init(viewModel: FormPart02ViewModel) {
        self.viewModel = viewModel
    }

    override func prepare(router: Router) {
        viewModel.processAction = { action in
            switch action {
            case .previous:
                router.pop()
            case .validate:
                self.viewModel.showAlert = true
            case .alertValidate:
//                router.popTo(coordinatorType: AgendaCoordinator.self)
                self.viewModel.actionIsConfirmed?()
            }
        }
    }

    override func toView() -> AnyView {
        AnyView(FormPart02View(viewModel: viewModel))
    }

    func startNextlow(router: Router) {
        let viewModel = FormPart01ViewModel()
        let coordinator = FormPart01Coordinator(viewModel: viewModel)
        coordinator.prepare(router: router)
        router.presentSheet(coordinator: nil)
        router.push(coordinator: coordinator)
    }
}
