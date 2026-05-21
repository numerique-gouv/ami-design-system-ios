//
//  CardView.swift
//  Ami-lab-Production
//
//  Created by Nicolas Buquet on 05/03/2026.
//  Copyright © 2026 DINUM. All rights reserved.
//

import AmiDesignSystem
import SwiftUI

struct CardView: View {
    @ObservedObject private var viewModel: ViewModel

    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }

    @ViewBuilder
    private var dateColumn: some View {
        VStack {
            Text(viewModel.dateWeekday)
                .font(.caption)
            Text(String(viewModel.dateDay))
                .font(.body)
                .bold()
        }
    }

    @ViewBuilder
    private var contentColumn: some View {
        HStack(spacing: 0.0) {
            VStack(alignment: .leading, spacing: 8.0) {
                PillTypeView(label: viewModel.type.label,
                             iconName: viewModel.type.iconName,
                             foregroundColor: viewModel.type.foregroundColor,
                             backgroundColor: viewModel.type.backgroundColor)
                PillPeriodView(text: viewModel.period.text,
                               foregroundColor: Color(hex: 0x161616),
                               backgroundColor: Color(hex: 0xEEEEEE))
                Text(viewModel.title)
                    .font(.dsfrH6)
                    .bold()
                    .foregroundStyle(AmiDesignSystem.Colors.Text.Title.blueFrance.swiftUIColor)
                    .multilineTextAlignment(.leading)
                if let description = viewModel.description {
                    Text(description)
                        .font(.footnote)
                        .foregroundStyle(Color(hex: 0x3A3A3A))
                        .multilineTextAlignment(.leading)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.trailing, 8.0)
            Image(systemName: "chevron.right")
                .font(.caption)
                .bold()
        }
        .padding()
        .background(viewModel.isSelected ? Color(hex: 0xECECFE) : .white)
        .border(Color(hex: 0xDDDDDD), width: 1.0)
    }

    var body: some View {
        HStack(alignment: .top, spacing: 0.0) {
            dateColumn
                .padding(.trailing, 16.0)
            contentColumn
        }
    }
}

#Preview {
    let cardsViewModels = [
        CardView.ViewModel(date: .now,
                           type: .consommation,
                           period: .from(Date()),
                           title: "Soldes d’hiver 👜"),
        CardView.ViewModel(date: .now,
                           type: .logement,
                           period: .fromTo(Date().advanced(by: -86400), Date().advanced(by: 86400)),
                           title: "Opération Tranquillité Vacances 🏠",
                           description: "Inscrivez-vous pour protéger votre domicile pendant votre absence"),
        CardView.ViewModel(date: .now,
                           type: .vacances,
                           period: .fromTo(Date().advanced(by: -86400), Date().advanced(by: 86400)),
                           title: "Vacances de Noël 🎄"),
        CardView.ViewModel(date: .now,
                           type: .jourFerie,
                           period: .from(Date().advanced(by: -86400)),
                           title: "Opération Tranquillité Vacances 🏠",
                           description: "Inscrivez-vous pour protéger votre domicile pendant votre absence"),
        CardView.ViewModel(date: .now,
                           type: .consommation,
                           period: .from(Date()),
                           title: "Soldes d’hiver 👜"),
        CardView.ViewModel(date: .now,
                           type: .logement,
                           period: .fromTo(Date().advanced(by: -86400), Date().advanced(by: 86400)),
                           title: "Opération Tranquillité Vacances 🏠",
                           description: "Inscrivez-vous pour protéger votre domicile pendant votre absence"),
        CardView.ViewModel(date: .now,
                           type: .vacances,
                           period: .fromTo(Date().advanced(by: -86400), Date().advanced(by: 86400)),
                           title: "Vacances de Noël 🎄"),
        CardView.ViewModel(date: .now,
                           type: .jourFerie,
                           period: .from(Date().advanced(by: -86400)),
                           title: "Opération Tranquillité Vacances 🏠",
                           description: "Inscrivez-vous pour protéger votre domicile pendant votre absence"),
    ]

    NavigationStack {
        List {
            ForEach(cardsViewModels) { viewModel in
                CardView(viewModel: viewModel)
                    .listRowInsets(EdgeInsets(top: 0.0, leading: 16.0, bottom: 0.0, trailing: 16.0))
                    .listRowSeparator(.hidden)
            }
            .onDelete { itemsIndexes in
                print("Delete \(itemsIndexes)")
            }
        }
        .listStyle(.plain)
        .listRowSpacing(8.0)
        .navigationTitle("Mon agenda")
    }
}
