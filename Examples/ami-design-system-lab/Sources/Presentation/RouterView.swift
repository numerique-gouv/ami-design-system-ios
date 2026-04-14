//
//  RouterView.swift
//  Ami-lab-Production
//
//  Created by Nicolas Buquet on 05/03/2026.
//

import SwiftUI

struct RouterView: View {
    @StateObject var router: Router

    @ViewBuilder
    private var rootNavigationView: some View {
        NavigationStack(path: $router.path) {
            router.rootCoordinator.toView()
                .navigationDestination(for: AnyCoordinator.self) { coordinator in
                    coordinator.toView()
                }
        }
    }

    @ViewBuilder
    private var rootSimpleView: some View {
        router.rootCoordinator.toView()
    }

    @ViewBuilder
    private var rootView: some View {
        if router.useNavigationStack {
            rootNavigationView
        } else {
            router.rootCoordinator.toView()
        }
    }

    var body: some View {
        rootView
//            .toolbar(<#T##visibility: Visibility##Visibility#>, for: .tabBar)
            .sheet(item: $router.presentedSheet) { coordinator in
                coordinator.toView()
            }
            .fullScreenCover(item: $router.fullScreenCover) { coordinator in
                coordinator.toView()
            }
    }
}

#Preview {
    let viewModel = StartViewModel()
    let coordinator = StartViewCoordinator(viewModel: viewModel)
    let router = Router(rootCoordinator: coordinator)
    coordinator.prepare(router: router)
    viewModel.processAction = { action in
        switch action {
        case .colorGallery:
            print("colorGallery tapped!")
        case .iconGallery:
            print("iconGallery tapped!")
        case .fontGallery:
            print("fontGallery tapped!")
        case .demoUI:
            print("Demo UI tapped!")
        }
    }
    return RouterView(router: router)
}
