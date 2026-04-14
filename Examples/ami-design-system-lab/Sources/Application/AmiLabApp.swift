//
//  AmiLabApp.swift
//
//
//  Created by Nicolas Buquet on 05/03/2026.
//

import AmiDesignSystem
import SwiftUI

@main
struct AmiLabApp: App {
    @State var router: Router = {
        let viewModel = StartViewModel()
        viewModel.processAction = { action in
            switch action {
            case .colorGallery:
                print("colorGallery tapped!")
            case .iconGallery:
                print("iconGallery tapped!")
            case .fontGallery:
                print("colofontGalleryrGallery tapped!")
            case .demoUI:
                print("Demo UI tapped!")
            }
        }
        let coordinator = StartViewCoordinator(viewModel: viewModel)

//            let viewModel = MainViewModel()
//        let coordinator = MainViewCoordinator(viewModel: MainViewModel())

        let router = Router(rootCoordinator: coordinator, useNavigationStack: true)
        coordinator.prepare(router: router)
        return router
    }()

    init() {
        FontLoader.registerFonts()
    }

    var body: some Scene {
        WindowGroup {
            RouterView(router: router)
//            router.rootCoordinator.toView()
        }
    }
}
