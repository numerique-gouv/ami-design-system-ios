//
//  MainView.swift
//  AMI-lab-xcodegen
//
//  Created by Nicolas Buquet on 18/03/2026.
//  Copyright © 2026 DINUM. All rights reserved.
//

import SwiftUI

struct MainView: View {
    @ObservedObject private var viewModel: MainViewModel

    init(viewModel: MainViewModel) {
        self.viewModel = viewModel
    }

    @ViewBuilder
    private func fakeView(title: String, iconName: String, tag: MainViewModel.Tabs) -> some View {
        NavigationStack {
            Text(title)
                .font(.title)
                .bold()
        }
        .tabItem {
            Image(systemName: iconName)
            Text(title)
        }
        .tag(tag)
        .navigationTitle(title)
    }

    var body: some View {
        TabView(selection: $viewModel.selectedTab) {
            fakeView(title: "Accueil", iconName: "house", tag: MainViewModel.Tabs.home)

            RouterView(router: viewModel.agendaRouter)
//            viewModel.agendaCoordinator.toView()
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Agenda")
                }
                .tag(MainViewModel.Tabs.agenda)

            fakeView(title: "Services", iconName: "squareshape.split.2x2", tag: MainViewModel.Tabs.services)

            fakeView(title: "Suivi", iconName: "point.bottomleft.forward.to.arrow.triangle.scurvepath", tag: MainViewModel.Tabs.tracking)
        }
    }
}

#Preview {
    MainView(viewModel: MainViewModel())
}
