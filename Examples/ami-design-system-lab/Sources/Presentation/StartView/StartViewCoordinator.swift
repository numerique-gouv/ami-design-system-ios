//
//  StartViewCoordinator.swift
//  Ami-lab-Production
//
//  Created by Nicolas Buquet on 06/03/2026.
//  Copyright © 2026 DINUM. All rights reserved.
//

import AmiDesignSystem
import Foundation
import SwiftUI

final class StartViewCoordinator: AnyCoordinator {
    private let viewModel: StartViewModel

    required init(viewModel: StartViewModel) {
        self.viewModel = viewModel
    }

    override func prepare(router: Router) {
        viewModel.processAction = { action in
            switch action {
            case .colorGallery:
                self.pushColorGallery(router: router)
            case .iconGallery:
                self.pushIconGallery(router: router)
            case .fontGallery:
                self.pushFontGallery(router: router)
            case .buttonGallery:
                self.pushButtonGallery(router: router)
            case .demoUI:
                self.pushMainView(router: router)
            }
        }
    }

    override func toView() -> AnyView {
        AnyView(StartView(viewModel: viewModel))
    }

    func pushMainView(router: Router) {
        let viewModel = MainViewModel()
        let coordinator = MainViewCoordinator(viewModel: viewModel)
        coordinator.prepare(router: router)
        router.setRoot(coordinator: coordinator, useNavigationStack: false)
    }

    func pushColorGallery(router: Router) {
        let viewModel = ColorGalleryViewModel(flatItemList: AmiDesignSystem.Colors.allColors)
        let coordinator = ColorGalleryCoordinator(viewModel: viewModel)
        coordinator.prepare(router: router)
        router.push(coordinator: coordinator)
    }

    func pushIconGallery(router: Router) {
        let viewModel = IconGalleryViewModel(flatItemList: AmiDesignSystem.Icons.allImages)
        let coordinator = IconGalleryCoordinator(viewModel: viewModel)
        coordinator.prepare(router: router)
        router.push(coordinator: coordinator)
    }

    func pushFontGallery(router: Router) {
        let viewModel = FontGalleryViewModel()
        let coordinator = FontGalleryCoordinator(viewModel: viewModel)
        coordinator.prepare(router: router)
        router.push(coordinator: coordinator)
    }

    func pushButtonGallery(router: Router) {
        let viewModel = ButtonGalleryViewModel()
        let coordinator = ButtonGalleryCoordinator(viewModel: viewModel)
        coordinator.prepare(router: router)
        router.push(coordinator: coordinator)
    }

    func pushAgendaView(router: Router) {
        let viewModel = AgendaCoordinator.sampleViewModel()
        let coordinator = AgendaCoordinator(viewModel: viewModel)
        coordinator.prepare(router: router)
//        router.push(coordinator: coordinator)
        router.setRoot(coordinator: coordinator)
    }

    func pushFormView(router: Router) {
        let viewModel = FormPart01ViewModel()
        let coordinator = FormPart01Coordinator(viewModel: viewModel)
        coordinator.prepare(router: router)
        router.push(coordinator: coordinator)
    }

//    func pushMainViewSheet(router: Router) {
//        let viewModel = MainViewModel()
//        let coordinator = MainViewCoordinator(viewModel: viewModel)
//        coordinator.prepare(router: router)
//        router.presentSheet(coordinator: coordinator)
//    }
}
