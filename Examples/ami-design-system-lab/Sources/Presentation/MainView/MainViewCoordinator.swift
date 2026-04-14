//
//  MainViewCoordinator.swift
//  AMI-lab-xcodegen
//
//  Created by Nicolas Buquet on 18/03/2026.
//  Copyright © 2026 DINUM. All rights reserved.
//

import Foundation
import SwiftUI

final class MainViewCoordinator: AnyCoordinator {
    private let viewModel: MainViewModel!

    required init(viewModel: MainViewModel) {
        self.viewModel = viewModel
    }

    override func prepare(router: Router) {}

    override func toView() -> AnyView {
        AnyView(MainView(viewModel: viewModel))
    }
}
