//
//  FormPart01ViewModel.swift
//  Ami-lab-Production
//
//  Created by Nicolas Buquet on 06/03/2026.
//  Copyright © 2026 DINUM. All rights reserved.
//

import Foundation

final class FormPart01ViewModel: ObservableObject {
    typealias ProcessActionType = (Action) -> Void

    enum Action {
        case cancel
        case `continue`
    }

    var processAction: ProcessActionType?

    var actionIsConfirmed: (() -> Void)?

    @Published var lastName: String = ""
    @Published var firstName: String = ""
    @Published var dateFrom: Date?
    @Published var dateTo: Date?
}
