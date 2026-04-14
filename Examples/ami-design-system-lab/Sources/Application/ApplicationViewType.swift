//
//  ApplicationViewType.swift
//  AMI-lab-xcodegen
//
//  Created by Nicolas Buquet on 06/03/2026.
//  Copyright © 2026 DINUM. All rights reserved.
//

import Foundation
import SwiftUI

enum ApplicationViewType {
    case empty
    case start
    case aganda(AgendaView.ViewModel)

    var id: String { "\(self)" }

//    var view: AnyView {
//        AnyView(buildView())
//    }
//
//    private func buildView() -> any View {
//        switch self {
//        case .empty:
//            EmptyView()
//        case .start:
//            StartView()
//        case .aganda(let viewModel):
//            AgendaView(viewModel: viewModel)
//        }
//    }
}

// ApplicationViewType must be Hashable to be used as Router's elements.
// extension ApplicationViewType: Hashable, Equatable {
//    func hash(into hasher: inout Hasher) {
//        hasher.combine(id)
//    }
//
//    static func == (lhs: Self, rhs: Self) -> Bool {
//        lhs.id == rhs.id
//    }
// }
