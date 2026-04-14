//
//  MainViewModel.swift
//  AMI-lab-xcodegen
//
//  Created by Nicolas Buquet on 18/03/2026.
//  Copyright © 2026 DINUM. All rights reserved.
//

import Foundation

final class MainViewModel: ObservableObject {
    enum Tabs {
        case home
        case agenda
        case services
        case tracking
    }

    @Published var selectedTab = Tabs.agenda
    @Published var showToast = false

    let agendaRouter = {
        let agendaCoordinator = AgendaCoordinator(viewModel: AgendaCoordinator.sampleViewModel())
        let router = Router(rootCoordinator: agendaCoordinator)
        agendaCoordinator.prepare(router: router)
        return router
    }()

    let agendaCoordinator = AgendaCoordinator(viewModel: AgendaCoordinator.sampleViewModel())
}
