//
//  FormPart02ViewModel.swift
//  Ami-lab-Production
//
//  Created by Nicolas Buquet on 06/03/2026.
//  Copyright © 2026 DINUM. All rights reserved.
//

import Foundation

final class FormPart02ViewModel: ObservableObject {
    typealias ProcessActionType = (Action) -> Void

    enum Action {
        case previous
        case validate
        case alertValidate
    }

    lazy var alertViewModel = AlertViewModel(title: "Veuillez confirmer votre demande",
                                             message: "L’Opération Tranquillité Vacances implique un déplacement des gendarmes à votre domicile.",
                                             buttons: [
                                                 AlertButtonConfiguration(title: "Confirmer", type: .primary) {
                                                     self.showAlert = false
                                                     self.processAction?(.alertValidate)
                                                 },
                                                 AlertButtonConfiguration(title: "Annuler", type: .secondary) {
                                                     self.showAlert = false
                                                 },
                                             ])

    var processAction: ProcessActionType?

    var actionIsConfirmed: (() -> Void)?

    @Published var item01 = false
    @Published var item02 = false
    @Published var item03 = false
    @Published var item04 = false
    @Published var showAlert = false
}
