//
//  AgendaView-ViewModel.swift
//  Ami-lab-Production
//
//  Created by Nicolas Buquet on 06/03/2026.
//  Copyright © 2026 DINUM. All rights reserved.
//

import Foundation

extension AgendaView {
    class ViewModel: ObservableObject {
        typealias ProcessActionType = (Action) -> Void

        enum Action {
            case otv(CardView.ViewModel)
            case otvConfirmed
        }

        struct AgendaItem {
            let card: CardView.ViewModel
            let action: Action?
        }

        @Published var items: [AgendaItem]
        @Published var showConfirmationToast = false
        var processAction: ProcessActionType?

        init(items: [AgendaItem]) {
            self.items = items
        }

        func removeItems(at indexes: IndexSet) {
            items.remove(atOffsets: indexes)
        }

        func removeItem(_ item: AgendaItem) {
            items.removeAll { $0 == item }
        }

        lazy var actionIsConfirmed: (() -> Void)? = {
            self.processAction?(.otvConfirmed)
        }
    }
}

extension AgendaView.ViewModel.AgendaItem: Identifiable & Equatable {
    var id: CardView.ViewModel.ID { card.id }

    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id
    }
}
