//
//  AlertButtonView.swift
//  Ami-lab-Production
//
//  Created by Nicolas Buquet on 16/03/2026.
//  Copyright © 2026 DINUM. All rights reserved.
//

import SwiftUI

struct AlertButtonView: View {
    private var configuration: AlertButtonConfiguration

    init(configuration: AlertButtonConfiguration) {
        self.configuration = configuration
    }

    var buttonStyle: some ButtonStyle {
        switch configuration.type {
        case .primary: DsfrButtonStyle(type: .primary)
        case .secondary: DsfrButtonStyle(type: .secondary)
        }
    }

    var body: some View {
        Button {
            configuration.action()
        } label: {
            Text(configuration.title)
                .frame(maxWidth: .infinity)
        }
        .buttonStyle(buttonStyle)
    }
}

#Preview {
    let configuration01 = AlertButtonConfiguration(title: "Button 01", type: .primary) {
        print("Button 01")
    }
    let configuration02 = AlertButtonConfiguration(title: "Button 02", type: .secondary) {
        print("Button 02")
    }
    AlertButtonView(configuration: configuration01)
    AlertButtonView(configuration: configuration02)
}
