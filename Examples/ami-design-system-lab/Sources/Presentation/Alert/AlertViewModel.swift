//
//  AlertViewModel.swift
//  Ami-lab-Production
//
//  Created by Nicolas Buquet on 16/03/2026.
//  Copyright © 2026 DINUM. All rights reserved.
//

import Foundation

final class AlertViewModel {
    typealias ProcessActionType = (Action) -> Void

    enum Action {
        case previous
        case validate
    }

    var processAction: ProcessActionType?

    init(title: String, message: String, buttons: [AlertButtonConfiguration]) {
        self.title = title
        self.message = message
        self.buttons = buttons
    }

    var title: String
    var message: String
    var buttons: [AlertButtonConfiguration]
}
