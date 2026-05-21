//
//  FormPart01View.swift
//  Ami-lab-Production
//
//  Created by Nicolas Buquet on 06/03/2026.
//  Copyright © 2026 DINUM. All rights reserved.
//

import AmiDesignSystem
import SwiftUI

struct FormPart01View: View {
    @ObservedObject private var viewModel: FormPart01ViewModel

    @State private var showDatePickerDateFrom = false

    init(viewModel: FormPart01ViewModel) {
        self.viewModel = viewModel
    }

    @ViewBuilder
    private var progress: some View {
        HStack(spacing: 0.0) {
            LinearProgressView(value: 0.5)
                .frame(height: 6.0)
                .padding(.trailing, 8.0)
            Text("1/2")
        }
    }

    @ViewBuilder
    private var title: some View {
        Text("Votre demande")
            .font(.title)
            .bold()
    }

    @ViewBuilder
    private var titlePeriod: some View {
        Text("Quand partez-vous ?")
            .font(.title3)
            .bold()
    }

    @ViewBuilder
    private var titleWhere: some View {
        Text("Quelle est la résidence à surveiller ?")
            .font(.title3)
            .bold()
    }

    @ViewBuilder
    private var contentWhere: some View {
        HStack(spacing: 0.0) {
            Text(LocalizedStringKey(
                """
                Votre résidence principale
                **39 rue du Cherche-Midi 89140 Pont-sur-Yonne**
                """
            ))
            .padding(EdgeInsets(top: 16.0, leading: 24.0, bottom: 16.0, trailing: 0.0))
            Spacer()
            Image(systemName: "pencil")
                .font(.title)
                .bold()
                .foregroundStyle(AmiDesignSystem.Colors.Artwork.Major.blueFrance.swiftUIColor)
                .padding(15.0)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .border(AmiDesignSystem.Colors.Border.Plain.blueFrance.swiftUIColor)
    }

    @ViewBuilder
    private var cancelButton: some View {
        Button {
            viewModel.processAction?(.cancel)
        } label: {
            Text("Annuler")
                .frame(maxWidth: .infinity)
        }
        .buttonStyle(ButtonStyleDsfr(type: .secondary))
    }

    @ViewBuilder
    private var continueButton: some View {
        Button {
            viewModel.processAction?(.continue)
        } label: {
            Text("Continuer")
                .frame(maxWidth: .infinity)
        }
        .buttonStyle(ButtonStyleDsfr(type: .primary))
    }

    var body: some View {
        progress
            .padding()

        ScrollView {
            VStack {
                Form {
                    title
                        .padding(.bottom, 16.0)

                    TextInputFieldView(label: "Nom",
                                       placeholder: "Nom",
                                       binding: $viewModel.lastName)
                    TextInputFieldView(label: "Prénom",
                                       placeholder: "Prénom",
                                       binding: $viewModel.firstName)
                        .padding(.vertical, 24.0)

                    titlePeriod
                        .padding(.bottom, 16.0)

                    DateInputFieldView(label: "Date de départ",
                                       bindedDate: $viewModel.dateFrom)

                    DateInputFieldView(label: "Date de retour",
                                       bindedDate: $viewModel.dateTo)
                        .padding(.vertical, 24.0)

                    titleWhere
                        .padding(.bottom, 16.0)

                    contentWhere

                    Spacer(minLength: 54.0)

                    HStack(spacing: 16.0) {
                        cancelButton
                        continueButton
                    }
                    .padding(.bottom, 32.0)
                }
                .formStyle(.columns)
                .padding(.horizontal, 16.0)
            }
        }
        .navigationTitle("Opération tranquilité vacances")
        .toolbar(.hidden, for: .tabBar)
    }
}

#Preview {
    FormPart01View(viewModel: FormPart01ViewModel())
}
