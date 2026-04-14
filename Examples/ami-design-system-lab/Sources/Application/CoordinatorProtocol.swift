//
//  CoordinatorProtocol.swift
//  Ami-lab-Production
//
//  Created by Nicolas Buquet on 06/03/2026.
//  Copyright © 2026 DINUM. All rights reserved.
//

import Foundation
import SwiftUI

class AnyCoordinator: Hashable & Identifiable {
    let id = UUID()

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    static func == (lhs: AnyCoordinator, rhs: AnyCoordinator) -> Bool {
        lhs.id == rhs.id
    }

    func prepare(router: Router) {
        fatalError("Method 'prepare(router:)' not implemented for type `\(Self.self)`")
    }

    func toView() -> AnyView {
        AnyView(Text("Method 'toView' not implemented for type `\(String(describing: self))`"))
    }
}
