//
//  AlertButtonConfiguration.swift
//  Ami-lab-Production
//
//  Created by Nicolas Buquet on 16/03/2026.
//  Copyright © 2026 DINUM. All rights reserved.
//

import Foundation

struct AlertButtonConfiguration: Identifiable {
    typealias AlertButtonActionType = () -> Void

    enum AlertButtonType {
        case primary
        case secondary
    }

    let id = UUID()
    let title: String
    let type: AlertButtonType
    let action: AlertButtonActionType

    init(title: String, type: AlertButtonType = .primary, action: @escaping AlertButtonActionType) {
        self.title = title
        self.type = type
        self.action = action
    }
}
