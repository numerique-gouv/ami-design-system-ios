//
//  InfoViewCoordinator.swift
//  Ami-lab-Production
//
//  Created by Nicolas Buquet on 07/03/2026.
//  Copyright © 2026 DINUM. All rights reserved.
//

import Foundation
import SwiftUI

final class InfoViewCoordinator: AnyCoordinator {
    private let viewModel: InfoViewModel

    required init(viewModel: InfoViewModel) {
        self.viewModel = viewModel
    }

    override func prepare(router: Router) {
        viewModel.processAction = { action in
            switch action {
            case .validate:
                self.startOtvFlow(router: router)
            }
        }
    }

    override func toView() -> AnyView {
        AnyView(InfoView(viewModel: viewModel))
    }

    func startOtvFlow(router: Router) {
        let viewModel = FormPart01ViewModel()
        viewModel.actionIsConfirmed = self.viewModel.actionIsConfirmed
        let coordinator = FormPart01Coordinator(viewModel: viewModel)
        coordinator.prepare(router: router)
        router.presentSheet(coordinator: nil)
        router.push(coordinator: coordinator)
    }

    static func sampleViewModel() -> InfoViewModel {
        InfoViewModel(
            title: "Opération Tranquillité Vacances",
            parts: [
                InfoViewModel.Part(title: "Quand ?",
                                   content: "À partir du 6 juin"),
                InfoViewModel.Part(title: "Comment ça fonctionne ?",
                                   content:
                                   """
                                   Pendant toute absence prolongée de votre domicile, vous pouvez vous inscrire à l'**opération tranquillité vacances**.

                                   **Les services de police ou de gendarmerie se chargent alors de surveiller votre logement**. Des patrouilles sont organisées pour passer aux abords de votre domicile.

                                   **Vous serez prévenu** en cas d'anomalies (dégradations, cambriolage ...).
                                   """),
            ]
        )
    }
}
