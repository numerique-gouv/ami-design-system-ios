//
//  AgendaCoordinator.swift
//  Ami-lab-Production
//
//  Created by Nicolas Buquet on 06/03/2026.
//  Copyright © 2026 DINUM. All rights reserved.
//

import Foundation
import SwiftUI

final class AgendaCoordinator: AnyCoordinator {
    private let viewModel: AgendaView.ViewModel!

    required init(viewModel: AgendaView.ViewModel) {
        self.viewModel = viewModel
    }

    var selectedCardViewModel: CardView.ViewModel?

    override func prepare(router: Router) {
        viewModel.processAction = { action in
            switch action {
            case let .otv(cardViewModel):
                print("OTV pressed!")
                self.selectedCardViewModel = cardViewModel
                self.presentInfo(router: router)
            case .otvConfirmed:
                self.selectedCardViewModel?.isSelected = true
                router.popTo(coordinatorType: AgendaCoordinator.self)
                self.viewModel.showConfirmationToast = true
                Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false) { _ in
                    self.viewModel.showConfirmationToast = false
                }
            }
        }
    }

    override func toView() -> AnyView {
        AnyView(AgendaView(viewModel: viewModel))
    }

    func presentInfo(router: Router) {
        let viewModel = InfoViewCoordinator.sampleViewModel()
        viewModel.actionIsConfirmed = self.viewModel.actionIsConfirmed
        let coordinator = InfoViewCoordinator(viewModel: viewModel)
        coordinator.prepare(router: router)
        router.presentSheet(coordinator: coordinator)
    }

    static func sampleViewModel() -> AgendaView.ViewModel {
        let selectableCard = CardView.ViewModel(date: .now,
                                                type: .logement,
                                                period: .fromTo(Date().advanced(by: -86400), Date().advanced(by: 86400)),
                                                title: "Opération Tranquillité Vacances 🏠",
                                                description: "Inscrivez-vous pour protéger votre domicile pendant votre absence")
        return AgendaView.ViewModel(items: [
            AgendaView.ViewModel.AgendaItem(card: CardView.ViewModel(date: .now,
                                                                     type: .consommation,
                                                                     period: .from(Date()),
                                                                     title: "Soldes d’hiver 👜"),
                                            action: nil),
            AgendaView.ViewModel.AgendaItem(card: selectableCard,
                                            action: .otv(selectableCard)),
            AgendaView.ViewModel.AgendaItem(card: CardView.ViewModel(date: .now,
                                                                     type: .vacances,
                                                                     period: .fromTo(Date().advanced(by: -86400), Date().advanced(by: 86400)),
                                                                     title: "Vacances de Noël 🎄"),
                                            action: nil),
            AgendaView.ViewModel.AgendaItem(card: CardView.ViewModel(date: .now,
                                                                     type: .jourFerie,
                                                                     period: .from(Date().advanced(by: -86400)),
                                                                     title: "Opération Tranquillité Vacances 🏠",
                                                                     description: "Inscrivez-vous pour protéger votre domicile pendant votre absence"),
                                            action: nil),
            AgendaView.ViewModel.AgendaItem(card: CardView.ViewModel(date: .now,
                                                                     type: .consommation,
                                                                     period: .from(Date()),
                                                                     title: "Soldes d’hiver 👜"),
                                            action: nil),
            AgendaView.ViewModel.AgendaItem(card: CardView.ViewModel(date: .now,
                                                                     type: .logement,
                                                                     period: .fromTo(Date().advanced(by: -86400), Date().advanced(by: 86400)),
                                                                     title: "Opération Tranquillité Vacances 🏠",
                                                                     description: "Inscrivez-vous pour protéger votre domicile pendant votre absence"),
                                            action: nil),
            AgendaView.ViewModel.AgendaItem(card: CardView.ViewModel(date: .now,
                                                                     type: .vacances,
                                                                     period: .fromTo(Date().advanced(by: -86400), Date().advanced(by: 86400)),
                                                                     title: "Vacances de Noël 🎄"),
                                            action: nil),
            AgendaView.ViewModel.AgendaItem(card: CardView.ViewModel(date: .now,
                                                                     type: .jourFerie,
                                                                     period: .from(Date().advanced(by: -86400)),
                                                                     title: "Opération Tranquillité Vacances 🏠",
                                                                     description: "Inscrivez-vous pour protéger votre domicile pendant votre absence"),
                                            action: nil),
        ])
    }
}
