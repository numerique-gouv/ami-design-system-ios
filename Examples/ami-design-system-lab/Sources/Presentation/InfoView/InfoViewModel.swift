//
//  InfoViewModel.swift
//  Ami-lab-Production
//
//  Created by Nicolas Buquet on 06/03/2026.
//  Copyright © 2026 DINUM. All rights reserved.
//

import Foundation

final class InfoViewModel {
    typealias ProcessActionType = (Action) -> Void

    enum Action {
        case validate
    }

    struct Part {
        let title: String
        let content: String
    }

    let title: String?
    let parts: [Part]
    var processAction: ProcessActionType?

    var actionIsConfirmed: (() -> Void)?

    init(title: String? = nil, parts: [Part]) {
        self.title = title
        self.parts = parts
    }
}
