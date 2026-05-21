//
//  StartViewModel.swift
//  Ami-lab-Production
//
//  Created by Nicolas Buquet on 06/03/2026.
//  Copyright © 2026 DINUM. All rights reserved.
//

import Foundation

class StartViewModel {
    struct Item: Identifiable {
        let id = UUID()
        let title: String
        let action: Action
    }

    typealias ProcessActionType = (Action) -> Void

    enum Action {
        case colorGallery
        case iconGallery
        case fontGallery
        case buttonGallery
        case demoUI
    }

    var processAction: ProcessActionType?

    let items = [
        Item(title: "Color Gallery", action: .colorGallery),
        Item(title: "Icon Gallery", action: .iconGallery),
        Item(title: "Font Gallery", action: .fontGallery),
        Item(title: "Button  UI", action: .buttonGallery),
        Item(title: "Démo UI", action: .demoUI),
    ]
}
