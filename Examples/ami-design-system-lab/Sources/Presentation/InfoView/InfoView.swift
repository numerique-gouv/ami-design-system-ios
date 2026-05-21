//
//  InfoView.swift
//  Ami-lab-Production
//
//  Created by Nicolas Buquet on 06/03/2026.
//  Copyright © 2026 DINUM. All rights reserved.
//

import AmiDesignSystem
import SwiftUI

struct InfoView: View {
    @Environment(\.dismiss) private var dismiss
    private let viewModel: InfoViewModel

    init(viewModel: InfoViewModel) {
        self.viewModel = viewModel
    }

    @ViewBuilder
    private func titleView(_ title: String) -> some View {
        Text(title)
            .font(.title)
            .bold()
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, 8.0)
    }

    @ViewBuilder
    private var bodyView: some View {
        VStack(alignment: .leading) {
            ForEach(Array(viewModel.parts.enumerated()), id: \.0) { _, part in
                Text(part.title)
                    .font(.body)
                    .bold()
                    .padding(.bottom, 8.0)
                Text(LocalizedStringKey(part.content))
                    .font(.body)
                    .padding(.bottom, 24.0)
            }
        }
    }

    @ToolbarContentBuilder
    private var toolbar: some ToolbarContent {
        ToolbarItem(placement: .topBarTrailing) {
            Button {
                dismiss()
            } label: {
                Image(systemName: "xmark")
            }
        }
    }

    var body: some View {
        NavigationStack {
            List {
                Section {
                    if let title = viewModel.title {
                        titleView(title)
                    }
                    bodyView
                }
                .listRowSeparator(.hidden)
                .listSectionSeparator(.hidden)
            }
            .listStyle(.plain)

            Button {
                viewModel.processAction?(.validate)
            } label: {
                Text("Bénéficier de ce service")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(ButtonStyleDsfr(type: .primary))
            .padding(.horizontal, 16.0)
            .toolbar {
                toolbar
            }
        }
    }
}

#Preview {
    let viewModel = InfoViewCoordinator.sampleViewModel()
    InfoView(viewModel: viewModel)
}
