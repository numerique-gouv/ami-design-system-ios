//
//  AlertView.swift
//  Ami-lab-Production
//
//  Created by Nicolas Buquet on 16/03/2026.
//  Copyright © 2026 DINUM. All rights reserved.
//

import SwiftUI

struct AlertView: View {
    private var viewModel: AlertViewModel

    init(viewModel: AlertViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 0.0) {
            Text(viewModel.title)
                .font(.title2)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .fixedSize(horizontal: false, vertical: true)
                .padding(.bottom, 16.0)

            Text(viewModel.message)
                .font(.body)
                .frame(maxWidth: .infinity, alignment: .leading)
                .fixedSize(horizontal: false, vertical: true)
                .padding(.bottom, 16.0)

            ForEach(viewModel.buttons) { button in
                AlertButtonView(configuration: AlertButtonConfiguration(title: button.title,
                                                                        type: button.type,
                                                                        action: button.action))
                    .padding(.top, 16.0)
            }
        }
        .frame(maxWidth: 280.0)
        .padding(24.0)
        .background {
            RoundedRectangle(cornerRadius: 28.0).fill(.white)
        }
    }
}

#Preview {
    let viewModel = AlertViewModel(title: "Veuillez confirmer votre demande",
                                   message: "L’Opération Tranquillité Vacances implique un déplacement des gendarmes à votre domicile.",
                                   buttons: [
                                       AlertButtonConfiguration(title: "Confirmer", type: .primary) {
                                           print("Confirmer")
                                       },
                                       AlertButtonConfiguration(title: "Annuler", type: .secondary) {
                                           print("Annuler")
                                       },
                                   ])
    Group {
        AlertView(viewModel: viewModel)
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(Color.pink)
}
